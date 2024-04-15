import UIKit
import ParseSwift

class WorkoutFeedController: UITableViewController {
    
    var workouts: [Workout] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Workout Feed"
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(refreshWorkouts(_:)), for: .valueChanged)
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        loadWorkouts()
    }

    func loadWorkouts() {
        guard let currentUser = User.current, let objectId = currentUser.objectId else {
            print("No current user available")
            return
        }
        let query = Workout.query("user" == Pointer<User>(objectId: objectId))
        query.include(["user"])
        query.order([.descending("createdAt")])
        query.find { [weak self] result in
            DispatchQueue.main.async {
                self?.refreshControl?.endRefreshing()
            }
            switch result {
            case .success(let fetchedWorkouts):
                self?.workouts = fetchedWorkouts
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print("Error fetching workouts: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    self?.showAlert("Failed to load workouts. Please try again.")
                }
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedWorkout = workouts[indexPath.row]
        performSegue(withIdentifier: "ShowWorkoutDetailsSegue", sender: selectedWorkout)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowWorkoutDetailsSegue" {
            guard let destinationVC = segue.destination as? WorkoutDisplayController,
                  let selectedIndexPath = tableView.indexPathForSelectedRow,
                  let workoutToSend = workouts[safe: selectedIndexPath.row] else {
              print("Failed to retrieve selected workout or destination.")
              return
            }
            print("About to set workout in WorkoutDisplayController: \(workoutToSend.title ?? "No title")")
            destinationVC.workout = workoutToSend
        }
    }





    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath) as? FeedCell else {
            fatalError("Cell not found")
        }
        let workout = workouts[indexPath.row]
        cell.configure(withWorkout: workout, number: indexPath.row + 1)
        return cell
    }
    
    @objc private func refreshWorkouts(_ sender: Any) {
            loadWorkouts()
    }

    func showAlert(_ message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}


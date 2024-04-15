import UIKit


class WorkoutLogController: UIViewController{
    
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var setsTextField: UITextField!
    @IBOutlet weak var repetitionsTextField: UITextField!
    @IBOutlet weak var durationTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Log Workout"
    }

    @IBAction func logWorkout() {
        guard let title = titleTextField.text, !title.isEmpty,
              let type = typeTextField.text, !type.isEmpty,
              let setsString = setsTextField.text, let sets = Int(setsString),
              let repetitionsString = repetitionsTextField.text, let repetitions = Int(repetitionsString),
              let durationString = durationTextField.text, let duration = Int(durationString) else {
            showAlert(message: "Please fill in all fields before logging your workout.")
            return
        }

        var workout = Workout()
        workout.title = title
        workout.type = type
        workout.sets = sets
        workout.repetitions = repetitions
        workout.duration = duration
        workout.user = User.current  // Assuming User.current is your logged-in user

        workout.save { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    print("Workout successfully logged")
                    self?.clearTextFields()
                    self?.navigationController?.popViewController(animated: true)
                case .failure(let error):
                    print("Error logging workout: \(error.localizedDescription)")
                    self?.showAlert(message: "Failed to log workout. Please try again.")
                }
            }
        }
    }
    
    // Inside WorkoutFeedController
    @IBAction func didTapAddWorkoutButton(_ sender: Any) {
        if let workoutLogVC = storyboard?.instantiateViewController(withIdentifier: "WorkoutLogController") as? WorkoutLogController {
            navigationController?.pushViewController(workoutLogVC, animated: true)
        } else {
            print("Instantiation from storyboard failed.")
        }
    }




    private func clearTextFields() {
        titleTextField.text = ""
        typeTextField.text = ""
        setsTextField.text = ""
        repetitionsTextField.text = ""
        durationTextField.text = ""
    }

    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}

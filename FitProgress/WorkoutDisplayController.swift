// WorkoutDisplayController.swift
import Foundation
import UIKit

class WorkoutDisplayController: UIViewController {
    @IBOutlet weak var workoutTitleLabel: UILabel!
    @IBOutlet weak var workoutTypeLabel: UILabel!
    @IBOutlet weak var repetitionsLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var setLabel: UILabel!
    @IBOutlet weak var currentWeightLabel: UILabel!
    
    var workout: Workout?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        displayWorkoutDetails()
    }

    private func displayWorkoutDetails() {
        guard let workout = workout else {
            print("Workout data is not available.")
            return
        }

        print("Setting workout details on the screen.")
        workoutTitleLabel.text = workout.title ?? "N/A"
        workoutTypeLabel.text = "Type: \(workout.type ?? "N/A")"
        repetitionsLabel.text = "Reps: \(workout.repetitions ?? 0)"
        durationLabel.text = "Duration: \(workout.duration ?? 0) mins"
        setLabel.text = "Sets: \(workout.sets ?? 0)"
        currentWeightLabel.text = "Weight: \(workout.user?.currentWeight ?? 0) lbs"
    }



    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

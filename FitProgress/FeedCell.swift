import Foundation
import UIKit

class FeedCell: UITableViewCell {
    @IBOutlet weak var workoutTitleLabel: UILabel!
    @IBOutlet weak var workoutTypeLabel: UILabel!
    @IBOutlet weak var repetitionsLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var setLabel: UILabel!
    @IBOutlet weak var currentWeightLabel: UILabel!
    
    func configure(withWorkout workout: Workout, number: Int) {
        workoutTitleLabel.text = "Exercise - \(workout.title ?? "N/A")"
        workoutTypeLabel.text = "Type: \(workout.type ?? "N/A")"
        repetitionsLabel.text = "Reps: \(workout.repetitions ?? 0)"
        durationLabel.text = "Duration: \(workout.duration ?? 0) mins"
        setLabel.text = "Sets: \(workout.sets ?? 0)"
        currentWeightLabel.text = "Weight: \(String(describing: workout.user?.currentWeight)) lbs"
    }

}


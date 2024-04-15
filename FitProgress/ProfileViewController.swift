import UIKit
import ParseSwift

class ProfileViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var weightGoalLabel: UILabel!
    @IBOutlet weak var currentWeightLabel: UILabel!
    @IBOutlet weak var updateWeightTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        loadUserProfile()
    }
    
    func loadUserProfile() {
        guard let currentUser = User.current else {
            print("No current user found")
            transitionToLoginScreen()
            return
        }
        
        // Format the label text as specified
        nameLabel.text = "\(currentUser.name ?? "User")'s Profile"
        usernameLabel.text = "Username - \(currentUser.username ?? "N/A")"
        currentWeightLabel.text = "Current Weight - \(currentUser.currentWeight ?? 0) lbs"
        weightGoalLabel.text = "Weight Goal - \(currentUser.weightGoal ?? 0) lbs"
    }


    
    @IBAction func updateWeightButtonTapped(_ sender: UIButton) {
        guard let weightText = updateWeightTextField.text, let weight = Int(weightText), !weightText.isEmpty else {
            showErrorAlert(message: "Please enter a valid weight.")
            return
        }

        // Fetch the current user again since it's immutable
        if var currentUser = User.current {
            currentUser.currentWeight = weight
            currentUser.save { result in
                switch result {
                case .success(_):
                    print("Successfully updated user weight to \(weight)")
                    DispatchQueue.main.async {
                        self.currentWeightLabel.text = "Current Weight - \(weight) lbs"
                    }
                case .failure(let error):
                    print("Error updating user weight: \(error.localizedDescription)")
                    DispatchQueue.main.async {
                        self.showErrorAlert(message: "Failed to update weight. Please try again.")
                    }
                }
            }
        } else {
            showErrorAlert(message: "No current user found.")
        }
    }

    
    private func showErrorAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true)
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        User.logout { result in
            switch result {
            case .success:
                print("Successfully logged out")
                DispatchQueue.main.async {
                    self.transitionToLoginScreen()
                }
            case .failure(let error):
                print("Logout failed: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    self.showErrorAlert(message: "Logout failed. Please try again.")
                }
            }
        }
        
    }
    
    func transitionToLoginScreen() {
        // Get the scene delegate from the connected scene
        guard let sceneDelegate = UIApplication.shared.connectedScenes
            .first(where: { $0.activationState == .foregroundActive })?.delegate as? SceneDelegate else {
            return
        }

        // Instantiate the login view controller from storyboard
        if let loginViewController = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
            loginViewController.modalPresentationStyle = .fullScreen
            // Replace the root view controller to the login view controller
            sceneDelegate.window?.rootViewController = loginViewController
            sceneDelegate.window?.makeKeyAndVisible()
        }
    }


}

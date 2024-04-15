import UIKit
import ParseSwift

class SignUpViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var currentWeightTextField: UITextField!
    @IBOutlet weak var weightGoalTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Sign Up"
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        guard let username = usernameTextField.text, !username.isEmpty,
              let email = emailTextField.text, !email.isEmpty,
              isValidEmail(email),
              let password = passwordTextField.text, !password.isEmpty,
              let currentWeightText = currentWeightTextField.text, !currentWeightText.isEmpty,
              let weightGoalText = weightGoalTextField.text, !weightGoalText.isEmpty,
              let currentWeight = Int(currentWeightText),
              let weightGoal = Int(weightGoalText) else {
            showMissingFieldsAlert()
            return
        }
        
        // Proceed with user creation
        attemptSignUp()
    }

    private func attemptSignUp() {
        guard let username = usernameTextField.text, !username.isEmpty,
              let email = emailTextField.text, !email.isEmpty,
              isValidEmail(email),
              let password = passwordTextField.text, !password.isEmpty,
              let currentWeightText = currentWeightTextField.text, !currentWeightText.isEmpty,
              let weightGoalText = weightGoalTextField.text, !weightGoalText.isEmpty,
              let currentWeight = Int(currentWeightText),
              let weightGoal = Int(weightGoalText) else {
            showMissingFieldsAlert()
            return
        }

        var newUser = User()
        newUser.username = username
        newUser.email = email
        newUser.password = password
        newUser.name = nameTextField.text
        newUser.currentWeight = currentWeight
        newUser.weightGoal = weightGoal

        newUser.signup { [weak self] result in
            switch result {
            case .success(let user):
                print("User signed up and logged in successfully: \(user)")
                DispatchQueue.main.async {
                    self?.handleSuccessfulSignup()
                }
            case .failure(let error):
                print("Error signing up: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    // More specific error handling based on the error code
                    if error.code.rawValue == 125 { // Parse's specific code for invalid email format
                        self?.showAlert(description: "Invalid email format. Please enter a valid email address.")
                    } else {
                        self?.showAlert(description: "Signup failed: \(error.localizedDescription)")
                    }
                }
            }
        }
    }


    private func handleSuccessfulSignup() {
        // The user is already set as current if signup was successful
        // No need to set User.current manually
        transitionToLoggedInState()
    }


    private func showAlert(description: String) {
        let alertController = UIAlertController(title: "Error", message: description, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true)
    }

    private func showMissingFieldsAlert() {
        showAlert(description: "Please fill in all fields and make sure the email is in the correct format.")
    }


    private func transitionToLoggedInState() {
        if let mainTabBarController = storyboard?.instantiateViewController(withIdentifier: "MainTabBarController") as? UITabBarController {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let sceneDelegate = windowScene.delegate as? SceneDelegate {
                sceneDelegate.window?.rootViewController = mainTabBarController
                sceneDelegate.window?.makeKeyAndVisible()
            }
        }
    }
}

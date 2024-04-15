import UIKit
import ParseSwift

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {        super.viewDidLoad()
        self.title = "Login"
    }

    @IBAction func loginUser(_ sender: UIButton) {
        guard let username = usernameTextField.text, !username.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            showAlert(message: "Username and password cannot be empty.")
            return
        }

        User.login(username: username, password: password) { result in
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self.transitionToMainInterface()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.showAlert(message: "Login failed: \(error.localizedDescription)")
                }
            }
        }
    }

    private func transitionToMainInterface() {
        guard let sceneDelegate = UIApplication.shared.connectedScenes
            .first(where: { $0.activationState == .foregroundActive })?.delegate as? SceneDelegate,
            let mainTabBarController = storyboard?.instantiateViewController(withIdentifier: "MainTabBarController") as? UITabBarController else {
            return
        }

        sceneDelegate.window?.rootViewController = mainTabBarController
        sceneDelegate.window?.makeKeyAndVisible()
    }



    @IBAction func navigateToCreateAccount(_ sender: UIButton) {
        performSegue(withIdentifier: "showCreateAccountSegue", sender: self)
    }

    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }

    private func navigateToMainInterface() {
        if let workoutFeedController = storyboard?.instantiateViewController(withIdentifier: "WorkoutFeedController") as? WorkoutFeedController {
            navigationController?.pushViewController(workoutFeedController, animated: true)
        }
    }

}

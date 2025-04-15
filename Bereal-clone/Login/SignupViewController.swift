//
//  SignupViewController.swift
//  Bereal-clone
//
//  Created by Semen Kolesnykov on 2/16/25.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var UsernameTextfield: UITextField!
    @IBOutlet weak var EmailTextfield: UITextField!
    @IBOutlet weak var PasswordTextfield: UITextField!
    
    @IBAction func onTapSignup(_ sender: Any) {
        guard let username = UsernameTextfield.text,
              let email = EmailTextfield.text,
              let password = PasswordTextfield.text,
              !username.isEmpty,
              !email.isEmpty,
              !password.isEmpty else {

            showMissingFieldsAlert()
            return
        }

        // TODO: Pt 1 - Parse user sign up
        var newUser = Users()
        newUser.username = username
        newUser.email = email
        newUser.password = password

        newUser.signup { [weak self] result in

            switch result {
            case .success(let user):

                print("✅ Successfully signed up user \(user)")

                // Post a notification that the user has successfully signed up.
                NotificationCenter.default.post(name: Notification.Name("login"), object: nil)

            case .failure(let error):
                // Failed sign up
                self?.showAlert(description: error.localizedDescription)
            }
        }

    }
    
    private func showAlert(description: String?) {
        let alertController = UIAlertController(title: "Unable to Sign Up", message: description ?? "Unknown error", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }

    private func showMissingFieldsAlert() {
        let alertController = UIAlertController(title: "Opps...", message: "We need all fields filled out in order to sign you up.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   

}

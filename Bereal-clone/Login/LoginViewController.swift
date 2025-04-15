//
//  ViewController.swift
//  Bereal-clone
//
//  Created by Semen Kolesnykov on 2/16/25.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var PasswordTextfield: UITextField!
    @IBOutlet weak var UsernameTextfield: UITextField!
    
    @IBAction func onTap(_ sender: Any) {
        // Make sure all fields are non-nil and non-empty.
        guard let username = UsernameTextfield.text,
              let password = PasswordTextfield.text,
              !username.isEmpty,
              !password.isEmpty else {

            showMissingFieldsAlert()
            return
        }

        
        // Log in the parse user
        Users.login(username: username, password: password) { [weak self] result in

            switch result {
            case .success(let user):
                print("✅ Successfully logged in as user: \(user)")

                // Post a notification that the user has successfully logged in.
                NotificationCenter.default.post(name: Notification.Name("login"), object: nil)

            case .failure(let error):
                self?.showAlert(description: error.localizedDescription)
            }
        }

    }
    
    private func showAlert(description: String?) {
        let alertController = UIAlertController(title: "Unable to Log in", message: description ?? "Unknown error", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }

    private func showMissingFieldsAlert() {
        let alertController = UIAlertController(title: "Opps...", message: "We need all fields filled out in order to log you in.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


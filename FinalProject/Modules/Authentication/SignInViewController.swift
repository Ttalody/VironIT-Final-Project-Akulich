//
//  SignInViewController.swift
//  FinalProject
//
//  Created by user on 01.09.2022.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var repeatPasswordTF: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        errorLabel.isHidden = true
        
        let errorLabelTap = UITapGestureRecognizer(target: self, action: #selector(tapErrorLabel))
        view.addGestureRecognizer(errorLabelTap)
        
        let tapToCloseKeyboard = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapToCloseKeyboard)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tabBar = segue.destination as? UITabBarController {
            if let profileNavC = tabBar.viewControllers?.last as? UINavigationController {
                if let profileVC = profileNavC.topViewController as? ProfileViewController {
                    profileVC.userName = firstNameTF.text! + " " + lastNameTF.text!
                }
            }
        }
    }
    
    // TODO
    
    func register(login: String?, password: String?, completion: @escaping (AuthResult) -> Void) {
        guard Validators.isFilled(login: loginTF.text, firstName: firstNameTF.text, lastName: lastNameTF.text, password: passwordTF.text, repeatedPassword: repeatPasswordTF.text) else {
            completion(.failure(AuthError.emptyField))
            return
        }
    }
    
    @objc func tapErrorLabel() {
        errorLabel.isHidden = true
    }

    @IBAction func didTapSignInButton(_ sender: Any) {
        register(login: loginTF.text, password: passwordTF.text) { (result) in
            switch result {
            case .success: self.performSegue(withIdentifier: "signInTabBarSegue", sender: self)
            case .failure(let error): self.errorLabel.isHidden = false; self.errorLabel.text = error.localizedDescription
            }
        }
    }
    
}

//
//  InitialViewController.swift
//  FinalProject
//
//  Created by user on 01.09.2022.
//

import UIKit

class InitialViewController: UIViewController {

    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        errorLabel.isHidden = true
        
        let errorLabelTap = UITapGestureRecognizer(target: self, action: #selector(tapErrorLabel))
        view.addGestureRecognizer(errorLabelTap)
        
        let tapToCloseKeyboard = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapToCloseKeyboard)

    }
    
    @objc func tapErrorLabel() {
        errorLabel.isHidden = true
    }
    
    @IBAction func logInButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "logInTabBarSegue", sender: self)
    }
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "signInSegue", sender: self)
    }
    
}

//
//  LogInViewController.swift
//  FinalProject
//
//  Created by user on 01.09.2022.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    @IBAction func didTapLoginButton(_ sender: Any) {
        performSegue(withIdentifier: "logInTabBarSegue", sender: self)
        print("log in tapped")
    }
    
}

//
//  ViewController.swift
//  FinalProject
//
//  Created by user on 31.08.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc1 = segue.destination as? LogInViewController {
            
        } else if let vc2 = segue.destination as? SignInViewController {
            
        }
    }
    
    @IBAction func unwindToStartVC(sender: UIStoryboardSegue) {}

    @IBAction func didTapLogInButton(_ sender: Any) {
        performSegue(withIdentifier: "toLogInVC", sender: self)
    }
    
    @IBAction func didTapSignInButton(_ sender: Any) {
        performSegue(withIdentifier: "toSignInVC", sender: self)
    }
}

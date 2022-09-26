//
//  ProfileViewController.swift
//  FinalProject
//
//  Created by user on 02.09.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var userName: String = ""

    @IBOutlet weak var userImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Theme.setupTheme()
        
        userImage.layer.cornerRadius = userImage.bounds.height/2
        userImage.layer.borderWidth = 0.5
        
        navigationItem.title = userName
        
        let tapToCloseKeyboard = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapToCloseKeyboard)

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    @IBAction func settingsButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "settingsSegue", sender: self)
    }
    
}

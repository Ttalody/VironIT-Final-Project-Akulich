//
//  MainTabBarViewController.swift
//  FinalProject
//
//  Created by user on 16.09.2022.
//

import UIKit

class MainTabBarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self

        // Do any additional setup after loading the view.
    }
    
//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        print("didSelectItem \(tabBarController?.selectedIndex)")
//        let userLoggedIn: Bool = true
//        if tabBar.selectedItem == tabBar.items?.last {
//            print("profile tab tapped")
//            if userLoggedIn == true {
//                let storyBoard: UIStoryboard = UIStoryboard(name: "MainTabBar", bundle: nil)
//                let profileVC = storyBoard.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController
//                self.present(profileVC!, animated: true, completion: nil)
//            } else {
//                let storyBoard = UIStoryboard(name: "Authentication", bundle: nil)
//                let initialVC = storyBoard.instantiateViewController(withIdentifier: "InitialViewController") as? InitialViewController
//                initialVC?.modalPresentationStyle = .overCurrentContext
//                self.present(initialVC!, animated: true, completion: nil)
//            }
//        }
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

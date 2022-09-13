//
//  UIViewControllerExtensions.swift
//  FinalProject
//
//  Created by user on 06.09.2022.
//

import UIKit

extension UIViewController {
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

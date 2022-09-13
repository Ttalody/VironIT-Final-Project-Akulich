//
//  UIViewContoller.swift
//  FinalProject
//
//  Created by user on 06.09.2022.
//

import UIKit

extension UIViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}

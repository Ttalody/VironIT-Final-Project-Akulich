//
//  Validators.swift
//  FinalProject
//
//  Created by user on 05.09.2022.
//

import UIKit

class Validators {
    static func isFilled(login: String?, firstName: String?, lastName: String?, password: String?, repeatedPassword: String?) -> Bool {
        guard !(login ?? "").isEmpty,
            !(firstName ?? "").isEmpty,
            !(lastName ?? "").isEmpty,
            !(password ?? "").isEmpty,
            !(repeatedPassword ?? "").isEmpty else {
                return false
        }
        return true
    }
}

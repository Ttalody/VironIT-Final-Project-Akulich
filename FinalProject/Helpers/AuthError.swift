//
//  AuthError.swift
//  FinalProject
//
//  Created by user on 02.09.2022.
//

import UIKit

enum AuthError: Error {
    case emptyField
    case unableToFindUser
    case unkownError
}

extension AuthError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .emptyField:
            return NSLocalizedString("Fill all the fields.", comment: "")
        case .unableToFindUser:
            return NSLocalizedString("Unable to find user.", comment: "")
        case .unkownError:
            return NSLocalizedString("Unknown error.", comment: "")
        }
    }
}

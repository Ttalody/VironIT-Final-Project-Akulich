//
//  User.swift
//  FinalProject
//
//  Created by user on 05.09.2022.
//

import UIKit

class User {
    private let id: String
    let login: String
    let password: String
    var firstName: String
    var lastName: String
    var email: String
    var profilePicture: UIImage
    var wishList: Set<Product>
    
    init() {
        self.id = ""
        self.login = ""
        self.password = ""
        self.firstName = ""
        self.lastName = ""
        self.email = ""
        self.profilePicture = UIImage()
        self.wishList = []
    }
    
    init(id: String,
         login: String,
         password: String,
         firstName: String,
         lastName: String,
         email: String,
         profilePicture: UIImage,
         wishList: Set<Product>) {
        self.id = id
        self.login = login
        self.password = password
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.profilePicture = profilePicture
        self.wishList = wishList
    }
    
    func change(email: String) {}
    func change(profilePicture: UIImage) {}
}

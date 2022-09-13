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
    var phoneNumber: String
    var birthday: String
    var profilePicture: UIImage
    var wishList: Set<Event>
    
    init() {
        self.id = UUID.init().uuidString
        self.login = ""
        self.password = ""
        self.firstName = ""
        self.lastName = ""
        self.email = ""
        self.phoneNumber = ""
        self.birthday = ""
        self.profilePicture = UIImage()
        self.wishList = []
    }
    
    init(id: String,
         login: String,
         password: String,
         firstName: String,
         lastName: String,
         email: String,
         phoneNumber: String,
         birthday: String,
         profilePicture: UIImage,
         wishList: Set<Event>) {
        self.id = UUID.init().uuidString
        self.login = login
        self.password = password
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phoneNumber = phoneNumber
        self.birthday = birthday
        self.profilePicture = profilePicture
        self.wishList = wishList
    }
    
    func change(email: String) {}
    func change(phoneNumber: String) {}
    func change(birthday: String) {}
    func change(profilePicture: UIImage) {}
}

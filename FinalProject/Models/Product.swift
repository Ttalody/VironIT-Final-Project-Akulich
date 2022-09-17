//
//  Event.swift
//  FinalProject
//
//  Created by user on 05.09.2022.
//

import UIKit

struct Product: Hashable {
    let id: String
    var category: String
    var title: String
    var description: String
    var date: String
    var price: Double
    
    init() {
        self.id = UUID.init().uuidString
        self.category = ""
        self.title = ""
        self.description = ""
        self.date = ""
        self.price = 0
    }
    
    init(category: String,
         title: String,
         description: String,
         date: String,
         price: Double) {
        self.id = UUID.init().uuidString
        self.category = category
        self.title = title
        self.description = description
        self.date = date
        self.price = price
    }
    
    func deleteEvent() {}
}

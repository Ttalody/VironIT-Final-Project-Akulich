//
//  Event.swift
//  FinalProject
//
//  Created by user on 05.09.2022.
//

import UIKit

struct Event: Hashable {
    let id: String
    var category: String
    var title: String
    var description: String
    var date: String
    var price: Double
    var place: String
    
    init() {
        self.id = UUID.init().uuidString
        self.category = ""
        self.title = ""
        self.description = ""
        self.date = ""
        self.price = 0
        self.place = ""
    }
    
    init(category: String,
         title: String,
         description: String,
         date: String,
         price: Double,
         place: String) {
        self.id = UUID.init().uuidString
        self.category = category
        self.title = title
        self.description = description
        self.date = date
        self.price = price
        self.place = place
    }
    
    func deleteEvent() {}
}

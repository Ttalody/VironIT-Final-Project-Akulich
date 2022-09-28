//
//  GameItem+CoreDataClass.swift
//  
//
//  Created by user on 28.09.2022.
//
//

import Foundation
import CoreData

@objc(GameItem)
public class GameItem: NSManagedObject {

}

extension GameItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GameItem> {
        return NSFetchRequest<GameItem>(entityName: "GameItem")
    }

    @NSManaged public var backgroundImage: String?
    @NSManaged public var id: Int64
    @NSManaged public var metacrtitcRating: Float
    @NSManaged public var name: String?
    @NSManaged public var rating: Float
    @NSManaged public var ratingsCount: Int64
    @NSManaged public var releaseDate: String?

}

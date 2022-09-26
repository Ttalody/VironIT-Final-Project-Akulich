//
//  Game.swift
//  FinalProject
//
//  Created by user on 19.09.2022.
//

import Foundation

struct GameResponseModel: Codable {
    let id: Int
    let name: String?
    let releaseDate: String?
    let backgroundImage: String?
    let rating: Float?
    let ratingsCount: Int?
    let metacriticRating: Int?
    let platforms: [PlatformGameResponse]
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case releaseDate = "released"
        case backgroundImage = "background_image"
        case rating
        case ratingsCount = "ratings_count"
        case metacriticRating = "metacritic"
        case platforms
    }
    
    init() {
        self.id = 0
        self.name = ""
        self.releaseDate = ""
        self.backgroundImage = ""
        self.rating = 0
        self.ratingsCount = 0
        self.metacriticRating = 0
        self.platforms = [PlatformGameResponse()]
    }
    
    init(id: Int,
         name: String,
         releaseDate: String,
         backgroundImage: String,
         rating: Float,
         ratingsCount: Int,
         metacriticRating: Int,
         platforms: [PlatformGameResponse]) {
        self.id = id
        self.name = name
        self.releaseDate = releaseDate
        self.backgroundImage = backgroundImage
        self.rating = rating
        self.ratingsCount = ratingsCount
        self.metacriticRating = metacriticRating
        self.platforms = platforms
    }
}

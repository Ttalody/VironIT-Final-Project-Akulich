//
//  GameScreenshotsResponseModel.swift
//  FinalProject
//
//  Created by user on 29.09.2022.
//

import Foundation

class GameScreenshotsResponseModel: Codable {
    let imageUrl: String?
    
    private enum CodingKeys: String, CodingKey {
        case imageUrl = "image"
    }
    
    init() {
        self.imageUrl = ""
    }
    
    init(imageUrl: String) {
        self.imageUrl = imageUrl
    }
}

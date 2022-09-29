//
//  PlatformGameResponseModel.swift
//  FinalProject
//
//  Created by user on 19.09.2022.
//

import Foundation

struct PlatformGameResponse: Codable {
    let name: String?
    
    private enum CodingKeys: String, CodingKey {
        case name
    }
    
    init() {
        self.name = ""
    }
    
    init(name: String) {
        self.name = name
    }
}

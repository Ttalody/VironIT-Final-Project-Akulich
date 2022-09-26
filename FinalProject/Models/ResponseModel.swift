//
//  ResponseModel.swift
//  FinalProject
//
//  Created by user on 19.09.2022.
//

import Foundation

struct ResponseModel: Codable {
    let count: Int?
    let next: String?
    let previous: String?
    let results: [GameResponseModel]?
    
    private enum CodingKeys: String, CodingKey {
        case count
        case next
        case previous
        case results
    }
    
    init() {
        self.count = 0
        self.next = ""
        self.previous = ""
        self.results = [GameResponseModel()]
    }
    
    init(count: Int, next: String, previous: String, results: [GameResponseModel]) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
}

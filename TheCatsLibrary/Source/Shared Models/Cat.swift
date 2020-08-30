//
//  Cat.swift
//  TheCatsLibrary
//
//  Created by Mauro Coletes on 24/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import Foundation

// MARK: - Cat
struct Cat: Codable {
    let description: String
    let name: String
    let id: String
    let dogFriendly: Int?
    let catFriendly: Int?
    let affectionLevel: Int?
    let vocalisation: Int?
    let childFriendly: Int?
    let temperament: String?
    
    enum CodingKeys: String, CodingKey {
        case description
        case name
        case id
        case dogFriendly = "dog_friendly"
        case catFriendly = "cat_friendly"
        case affectionLevel = "affection_level"
        case vocalisation
        case childFriendly = "child_friendly"
        case temperament
    }
}

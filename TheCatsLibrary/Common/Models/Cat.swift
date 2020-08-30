//
//  Cat.swift
//  TheCatsLibrary
//
//  Created by Mauro Coletes on 24/08/20.
//  Copyright © 2020 Mauro Coletes. All rights reserved.
//

import Foundation

//// MARK: - Cat
//struct Cat: Codable {
//    let temperament: String
//    let lifeSpan: String
//    let rex: Int
//    let id: String
//    let cfaURL: String?
//    let vocalisation: Int
//    let natural: Int
//    let affectionLevel: Int
//    let experimental: Int
//    let sheddingLevel: Int
//    let countryCodes: String
//    let indoor: Int
//    let catDescription: String
//    let lap: Int?
//    let childFriendly: Int
//    let healthIssues: Int
//    let intelligence: Int
//    let adaptability: Int
//    let strangerFriendly: Int
//    let name: String
//    let altNames: String?
//    let origin: String
//    let suppressedTail: Int
//    let socialNeeds: Int
//    let grooming: Int
//    let shortLegs: Int
//    let vetstreetURL: String?
//    let hairless: Int
//    let wikipediaURL: String?
//    let countryCode: String
//    let vcahospitalsURL: String?
//    let energyLevel: Int
//    let hypoallergenic: Int
//    let rare: Int
//    let weight: Weight
//    let dogFriendly: Int
//    let bidability: Int?
//    let catFriendly: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case temperament = "temperament"
//        case lifeSpan = "life_span"
//        case rex = "rex"
//        case id = "id"
//        case cfaURL = "cfa_url"
//        case vocalisation = "vocalisation"
//        case natural = "natural"
//        case affectionLevel = "affection_level"
//        case experimental = "experimental"
//        case sheddingLevel = "shedding_level"
//        case countryCodes = "country_codes"
//        case indoor = "indoor"
//        case catDescription = "description"
//        case lap = "lap"
//        case childFriendly = "child_friendly"
//        case healthIssues = "health_issues"
//        case intelligence = "intelligence"
//        case adaptability = "adaptability"
//        case strangerFriendly = "stranger_friendly"
//        case name = "name"
//        case altNames = "alt_names"
//        case origin = "origin"
//        case suppressedTail = "suppressed_tail"
//        case socialNeeds = "social_needs"
//        case grooming = "grooming"
//        case shortLegs = "short_legs"
//        case vetstreetURL = "vetstreet_url"
//        case hairless = "hairless"
//        case wikipediaURL = "wikipedia_url"
//        case countryCode = "country_code"
//        case vcahospitalsURL = "vcahospitals_url"
//        case energyLevel = "energy_level"
//        case hypoallergenic = "hypoallergenic"
//        case rare = "rare"
//        case weight = "weight"
//        case dogFriendly = "dog_friendly"
//        case bidability = "bidability"
//        case catFriendly = "cat_friendly"
//    }
//}
//
//// MARK: - Weight
//struct Weight: Codable {
//    let metric: String
//    let imperial: String
//
//    enum CodingKeys: String, CodingKey {
//        case metric = "metric"
//        case imperial = "imperial"
//    }
//}

// MARK: - Cat
struct Cat: Codable {
    let description: String
    let name: String
    let id: String
//    enum CodingKeys: String, CodingKey {
//        case catDescription = "description"
//        case name = "name"
//        case id
//    }
}

// MARK: - Weight

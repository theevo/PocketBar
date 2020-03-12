//
//  Drink.swift
//  PocketBar
//
//  Created by theevo on 3/12/20.
//  Copyright © 2020 theevo. All rights reserved.
//

import Foundation

struct TopLevelObject: Codable {
    let drinks: [Drink]
}

struct Drink: Codable {
    let name: String
    let instructions: String
    let thumbnail: URL
    
    enum CodingKeys: String, CodingKey{
        case name = "strDrink"
        case instructions = "strInstructions"
        case thumbnail = "strDrinkThumb"
    }
}

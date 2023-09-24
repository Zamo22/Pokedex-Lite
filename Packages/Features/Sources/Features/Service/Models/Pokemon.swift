//
//  Pokemon.swift
//  
//
//  Created by Zaheer Moola on 2023/09/24.
//

import Foundation

// Note: I've only taken a few fields from the API that I felt were valid here
// Additionally, I've made some assumptions about nullability based on logic as the API doesn't seem to specify

struct Pokemon: Decodable {
    var name: String
    var id: Int
    var height: Int?
    var weight: Int?
    var stats: [PokemonStat]?
    var sprites: PokemonSprites?
    var types: [PokemonType]?
}

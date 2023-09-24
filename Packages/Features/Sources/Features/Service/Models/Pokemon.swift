//
//  Pokemon.swift
//  
//
//  Created by Zaheer Moola on 2023/09/24.
//

import Foundation

// Note: I've only taken a few fields from the API that I felt were valid here

struct Pokemon: Decodable {
    var name: String
    var id: Int
    var height: Int?
    var weight: Int?
    var stats: [PokemonStat]?
    var sprites: PokemonSprites?
    var types: [PokemonTypeDetails]?
}

//
//  PokemonList.swift
//  
//
//  Created by Zaheer Moola on 2023/09/24.
//

import Foundation

struct PokemonList: Decodable {
    var count: Int
    var next: String?
    var previous: String?
    var results: [PokemonListItem]
}

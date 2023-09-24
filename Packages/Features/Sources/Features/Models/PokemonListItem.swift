//
//  PokemonListItem.swift
//  
//
//  Created by Zaheer Moola on 2023/09/24.
//

import Foundation

struct PokemonListItem: Decodable {
    var name: String
    var url: String
}

extension PokemonListItem: Identifiable {

    var id: String {
        self.url
    }

}

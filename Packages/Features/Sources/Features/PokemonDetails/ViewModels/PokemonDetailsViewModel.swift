//
//  PokemonDetailsViewModel.swift
//  
//
//  Created by Zaheer Moola on 2023/09/24.
//

import Foundation

@MainActor
class PokemonDetailsViewModel: ObservableObject {

    var pokemon: Pokemon

    init(pokemon: Pokemon) {
        self.pokemon = pokemon
    }
}

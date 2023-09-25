//
//  PokemonListResultsViewModel.swift
//  
//
//  Created by Zaheer Moola on 2023/09/25.
//

import Foundation

class PokemonListResultsViewModel: ObservableObject {

    var pokemonList: [PokemonListItem]

    @Published
    var searchText = ""

    init(list: [PokemonListItem]) {
        self.pokemonList = list
    }

    var searchResults: [PokemonListItem] {
        if searchText.isEmpty {
            return pokemonList
        } else {
            return pokemonList.filter { $0.name.contains(searchText.lowercased()) }
        }
    }
}

//
//  PokemonCardViewModel.swift
//  
//
//  Created by Zaheer Moola on 2023/09/24.
//

import Foundation
import Components
import DependencyContainer

class PokemonCardViewModel: ObservableObject {

    let pokemon: PokemonListItem

    @Injected
    var repository: PokemonDetailsRepository

    @Published
    var pokemonDetails: Loadable<Pokemon> = .loading

    init(pokemon: PokemonListItem) {
        self.pokemon = pokemon
    }

    func fetchPokemonDetails() async {
        do {
            let details = try await repository.getPokemonDetails(fromUrl: pokemon.url)
            pokemonDetails = .loaded(details)
        } catch {
            pokemonDetails = .error(error)
        }
    }
    
}

//
//  PokemonCardViewModel.swift
//  
//
//  Created by Zaheer Moola on 2023/09/24.
//

import Foundation
import Components
import DependencyContainer

@MainActor
class PokemonCardViewModel: ObservableObject {

    let pokemon: PokemonListItem

    @Injected
    private var repository: PokemonDetailsRepository

    @Published
    var pokemonDetails: Loadable<Pokemon> = .loading

    init(pokemon: PokemonListItem) {
        self.pokemon = pokemon
    }

    @Sendable func fetchPokemonDetails() async {
        do {
            let details = try await repository.getPokemonDetails(fromUrl: pokemon.url)
            pokemonDetails = .loaded(details)
        } catch {
            pokemonDetails = .error(error)
        }
    }
}

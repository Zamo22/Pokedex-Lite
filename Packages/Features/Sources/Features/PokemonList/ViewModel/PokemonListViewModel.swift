//
//  PokemonListViewModel.swift
//  
//
//  Created by Zaheer Moola on 2023/09/24.
//

import Foundation
import Components
import DependencyContainer

@MainActor
class PokemonListViewModel: ObservableObject {

    @Injected
    var repository: PokemonListRepository

    @Published
    var pokemonList: Loadable<[PokemonListItem]> = .loading

    @Sendable func fetchPokemonList() async {
        do {
            let list = try await repository.getPokemonList()
            pokemonList = .loaded(list)
        } catch {
            pokemonList = .error(error)
        }
    }

}

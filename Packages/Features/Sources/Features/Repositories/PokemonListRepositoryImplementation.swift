//
//  PokemonListRepositoryImplementation.swift
//  
//
//  Created by Zaheer Moola on 2023/09/24.
//

import Foundation
import DependencyContainer

struct PokemonListRepositoryImplementation: PokemonListRepository {

    @Injected
    private var service: PokemonService

    var pokemonListLimit = 100

    func getPokemonList() async throws -> [PokemonListItem] {
        try await service.getPokemonList(with: [.limit(pokemonListLimit)]).results
    }

}

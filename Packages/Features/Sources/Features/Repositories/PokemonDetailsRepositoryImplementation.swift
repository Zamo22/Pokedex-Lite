//
//  PokemonDetailsRepositoryImplementation.swift
//  
//
//  Created by Zaheer Moola on 2023/09/24.
//

import DependencyContainer

struct PokemonDetailsRepositoryImplementation: PokemonDetailsRepository {

    @Injected
    var service: PokemonService

        // TODO: Add caching

    func getPokemonDetails(fromUrl url: String) async throws -> Pokemon {
        try await service.getPokemonDetails(fromUrl: url)
    }
}

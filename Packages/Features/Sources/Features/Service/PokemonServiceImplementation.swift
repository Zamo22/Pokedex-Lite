//
//  PokemonServiceImplementation.swift
//  
//
//  Created by Zaheer Moola on 2023/09/24.
//

import Foundation
import DependencyContainer
import Networking

struct PokemonServiceImplementation: PokemonService {

    @Injected
    var client: NetworkingClient

    func getPokemonList(with parameters: [PokemonListQueryParameter]) async throws -> PokemonList {
        try await client.get(from: "/pokemon", with: parameters.queryItems)
    }

    func getPokemonDetails(fromUrl url: String) async throws -> Pokemon {
        try await client.get(fromUrl: url)
    }
    
}

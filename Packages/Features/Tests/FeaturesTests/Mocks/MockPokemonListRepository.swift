//
//  MockPokemonListRepository.swift
//  
//
//  Created by Zaheer Moola on 2023/09/25.
//

@testable import Features

class MockPokemonListRepository:  PokemonListRepository {

    var stubbedPokemonListResponse: [PokemonListItem]?
    var stubbedErrorResponse: Error?

    func getPokemonList() async throws -> [PokemonListItem] {
        if let stubbedPokemonListResponse {
            return stubbedPokemonListResponse
        } else if let stubbedErrorResponse {
            throw stubbedErrorResponse
        }
        throw MocksError.stubNotSet
    }

}

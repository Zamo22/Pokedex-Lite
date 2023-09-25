//
//  MockPokemonService.swift
//  
//
//  Created by Zaheer Moola on 2023/09/25.
//

import Foundation
@testable import Features

class MockPokemonService: PokemonService {

    var parameters: [PokemonListQueryParameter]?
    var url: String?

    var stubbedPokemonListResponse: PokemonList?
    var stubbedPokemonResponse: Pokemon?
    var stubbedErrorResponse: Error?

    func getPokemonList(with parameters: [PokemonListQueryParameter]) async throws -> PokemonList {
        self.parameters = parameters
        if let stubbedPokemonListResponse {
            return stubbedPokemonListResponse
        } else if let stubbedErrorResponse {
            throw stubbedErrorResponse
        }
        throw MocksError.stubNotSet
    }

    func getPokemonDetails(fromUrl url: String) async throws -> Pokemon {
        self.url = url
        if let stubbedPokemonResponse {
            return stubbedPokemonResponse
        } else if let stubbedErrorResponse {
            throw stubbedErrorResponse
        }
        throw MocksError.stubNotSet
    }

}

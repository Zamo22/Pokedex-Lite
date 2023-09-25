//
//  MockPokemonDetailsRepository.swift
//  
//
//  Created by Zaheer Moola on 2023/09/25.
//

@testable import Features

class MockPokemonDetailsRepository: PokemonDetailsRepository {

    var url: String?

    var stubbedPokemonResponse: Pokemon?
    var stubbedErrorResponse: Error?

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

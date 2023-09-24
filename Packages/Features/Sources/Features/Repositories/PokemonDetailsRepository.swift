//
//  PokemonDetailsRepository.swift
//  
//
//  Created by Zaheer Moola on 2023/09/24.
//

import Foundation

protocol PokemonDetailsRepository {
    func getPokemonDetails(fromUrl url: String) async throws -> Pokemon
}

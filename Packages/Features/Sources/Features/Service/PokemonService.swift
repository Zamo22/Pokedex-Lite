//
//  PokemonService.swift
//  
//
//  Created by Zaheer Moola on 2023/09/24.
//

import Foundation

protocol PokemonService {
    func getPokemonList(with parameters: [PokemonListQueryParameter]) async throws -> PokemonList
    func getPokemonDetails(fromUrl url: String) async throws -> Pokemon
}

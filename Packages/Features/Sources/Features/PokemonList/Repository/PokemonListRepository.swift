//
//  PokemonListRepository.swift
//  
//
//  Created by Zaheer Moola on 2023/09/24.
//

import Foundation

protocol PokemonListRepository {
    func getPokemonList() async throws -> [PokemonListItem]
}

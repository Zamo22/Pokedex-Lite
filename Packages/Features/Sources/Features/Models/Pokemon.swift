//
//  Pokemon.swift
//  
//
//  Created by Zaheer Moola on 2023/09/24.
//

import Foundation

// Note: I've only taken a few fields from the API that I felt were valid here

struct Pokemon: Decodable {
    var name: String
    var id: Int
    var height: Int?
    var weight: Int?
    var stats: [PokemonStat]?
    var sprites: PokemonSprites?
    var types: [PokemonTypeDetails]?
}

// MARK: - Helpers
extension Pokemon {

    var sortedTypes: [PokemonType] {
        guard let types else { return [] }
        return types.sorted(by: { $0.slot ?? 0 < $1.slot ?? 1 }).compactMap { $0.type }
    }

}

// MARK: - Preview helpers
extension Pokemon {
    static var example: Self {
        .init(name: "ivysaur", id: 2, height: 10, weight: 13,
              stats: [.hp(60), .attack(62), .defense(63),
                      .specialAttack(80), .specialDefense(80), .speed(60)],
              sprites: .init(
                frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png",
                officialFrontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png"),
              types: [.init(slot: 1, type: .grass), .init(slot: 2, type: .poison)])
    }
}

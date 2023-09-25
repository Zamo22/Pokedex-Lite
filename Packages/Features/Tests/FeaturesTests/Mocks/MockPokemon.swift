//
//  MockPokemon.swift
//  
//
//  Created by Zaheer Moola on 2023/09/25.
//

import Foundation
@testable import Features

extension Pokemon {
    static var mock: Pokemon {
        .init(
            name: "Ivysaur",
            id: 2,
            height: 10,
            weight: 130,
            stats: [.hp(60), .attack(62), .defense(63),
                    .specialAttack(80), .specialDefense(80), .speed(60)],
            types: [.init(slot: 2, type: .poison), .init(slot: 1, type: .grass)],
            abilities: [
                .init(slot: 1, ability: .init(name: "overgrow", url: "url")),
                .init(slot: 3, ability: .init(name: "chlorophyll", url: "url"))
            ]
        )
    }
}

extension Pokemon: Equatable {
    public static func == (lhs: Pokemon, rhs: Pokemon) -> Bool {
        lhs.id == rhs.id
    }
}

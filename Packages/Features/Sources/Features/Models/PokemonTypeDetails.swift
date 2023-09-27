//
//  PokemonType.swift
//  
//
//  Created by Zaheer Moola on 2023/09/24.
//

import Foundation

struct PokemonTypeDetails: Decodable {
    var slot: Int?
    var type: PokemonType?

    init(slot: Int?, type: PokemonType?) {
        self.slot = slot
        self.type = type
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.slot = try container.decodeIfPresent(Int.self, forKey: .slot)
        let typeInfo = try container.decode(PokemonTypeInfo.self, forKey: .type)
        self.type = typeInfo.name
    }

    enum CodingKeys: String, CodingKey {
        case slot, type
    }

    private struct PokemonTypeInfo: Decodable {
        var name: PokemonType?
    }
}

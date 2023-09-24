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
        let typeDetail = try container.decode(PokemonTypeDetails.self, forKey: .type)
        self.type = typeDetail.name
    }

    enum CodingKeys: String, CodingKey {
        case slot, type
    }

    private struct PokemonTypeDetails: Decodable {
        var name: PokemonType?
    }
}

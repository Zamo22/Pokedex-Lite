//
//  PokemonType.swift
//  
//
//  Created by Zaheer Moola on 2023/09/24.
//

import Foundation

struct PokemonType: Decodable {
    var slot: Int?
    var name: String?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.slot = try container.decodeIfPresent(Int.self, forKey: .slot)
        let typeDetail = try container.decode(PokemonTypeDetails.self, forKey: .type)
        self.name = typeDetail.name
    }

    enum CodingKeys: String, CodingKey {
        case slot, type
    }

    private struct PokemonTypeDetails: Decodable {
        var name: String?
    }
}

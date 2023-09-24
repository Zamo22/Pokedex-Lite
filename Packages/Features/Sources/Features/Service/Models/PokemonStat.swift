//
//  PokemonStat.swift
//  
//
//  Created by Zaheer Moola on 2023/09/24.
//

import Foundation

struct PokemonStat: Decodable {
    var baseStat: Int?
    var name: String?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.baseStat = try container.decodeIfPresent(Int.self, forKey: .baseStat)
        let statDetail = try container.decode(PokemonStatDetail.self, forKey: .stat)
        self.name = statDetail.name
    }

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case stat
    }

    private struct PokemonStatDetail: Decodable {
        var name: String?
    }
}

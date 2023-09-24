//
//  PokemonStat.swift
//  
//
//  Created by Zaheer Moola on 2023/09/24.
//

import Foundation

// Note: Instead of creating a DTO and then another model for this, I've opted to instead
// handle the logic whilst decoding
enum PokemonStat: Decodable {
    case hp(Int)
    case attack(Int)
    case defense(Int)
    case specialAttack(Int)
    case specialDefense(Int)
    case speed(Int)

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let statDetail = try container.decode(PokemonStatDetail.self, forKey: .stat)
        let statValue = try container.decode(Int.self, forKey: .baseStat)
        let statName = statDetail.name

        switch statName {
        case "hp":
            self = .hp(statValue)
        case "attack":
            self = .attack(statValue)
        case "defense":
            self = .defense(statValue)
        case "special-attack":
            self = .specialAttack(statValue)
        case "special-defense":
            self = .specialDefense(statValue)
        case "speed":
            self = .speed(statValue)
        default:
            throw DecodingError.typeMismatch(PokemonStat.self,
                                             .init(codingPath: [CodingKeys.stat],
                                                   debugDescription: "Unknown stat found"))
        }
    }

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case stat
    }

    private struct PokemonStatDetail: Decodable {
        var name: String?
    }
}

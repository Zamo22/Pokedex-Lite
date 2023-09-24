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
    var height: Int
    var weight: Int
    var stats: [PokemonStat]
    var sprites: PokemonSprites?
    var types: [PokemonTypeDetails]?
    var abilities: [PokemonAbilityDetails]?
}

// MARK: - Formatted Details
extension Pokemon {

    var sortedTypes: [PokemonType] {
        guard let types else { return [] }
        return types.sorted(by: { $0.slot ?? 0 < $1.slot ?? 1 }).compactMap { $0.type }
    }

    var formattedId: String {
        "#\(String(format: "%03d", id))"
    }

    var heightInMeters: String {
        let height: Double = Double((height)) / 10
        return "\(String(format: "%.1f", height)) m"
    }

    var weightInKilograms: String {
        let weight: Double = Double((weight)) / 10
        return "\(String(format: "%.1f", weight)) kg"
    }

    var concatenatedAbilities: String {
        guard let abilities else { return "N/A" }
        return abilities.map { $0.ability.name.capitalized }.joined(separator: ", ")
    }

}

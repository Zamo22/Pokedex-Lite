//
//  PokemonType.swift
//  
//
//  Created by Zaheer Moola on 2023/09/24.
//

import Foundation
import SwiftUI

enum PokemonType: String, Decodable {
    case normal
    case fire
    case water
    case electric
    case grass
    case ice
    case fighting
    case poison
    case ground
    case flying
    case psychic
    case bug
    case rock
    case ghost
    case dragon
    case dark
    case steel
    case fairy
}

extension PokemonType: Identifiable {
    var id: Self {
        return self
    }
}

// MARK: -  Color/Type mapping
extension PokemonType {

    var backgroundColor: Color {
        associatedColor.opacity(0.85)
    }

    var associatedColor: Color {
        switch self {
        case .normal:
            return .normalType
        case .fire:
            return .fireType
        case .water:
            return .waterType
        case .electric:
            return .electricType
        case .grass:
            return .grassType
        case .ice:
            return .iceType
        case .fighting:
            return .fightingType
        case .poison:
            return .poisonType
        case .ground:
            return .groundType
        case .flying:
            return .flyingType
        case .psychic:
            return .psychicType
        case .bug:
            return .bugType
        case .rock:
            return .rockType
        case .ghost:
            return .ghostType
        case .dragon:
            return .dragonType
        case .dark:
            return .darkType
        case .steel:
            return .steelType
        case .fairy:
            return .fairyType
        }
    }
}

//
//  Colors.swift
//  
//
//  Created by Zaheer Moola on 2023/09/24.
//

import SwiftUI

public extension Color {
    static var normalType: Color {
        .named("normalType")
    }

    static var fireType: Color {
        .named("fireType")
    }

    static var waterType: Color {
        .named("waterType")
    }

    static var electricType: Color {
        .named("electricType")
    }

    static var grassType: Color {
        .named("grassType")
    }

    static var iceType: Color {
        .named("iceType")
    }

    static var fightingType: Color {
        .named("fightingType")
    }

    static var poisonType: Color {
        .named("poisonType")
    }

    static var groundType: Color {
        .named("groundType")
    }

    static var flyingType: Color {
        .named("flyingType")
    }

    static var psychicType: Color {
        .named("psychicType")
    }

    static var bugType: Color {
        .named("bugType")
    }

    static var rockType: Color {
        .named("rockType")
    }

    static var ghostType: Color {
        .named("ghostType")
    }

    static var dragonType: Color {
        .named("dragonType")
    }

    static var darkType: Color {
        .named("darkType")
    }

    static var steelType: Color {
        .named("steelType")
    }

    static var fairyType: Color {
        .named("fairyType")
    }
}

private extension Color {
    static func named(_ name: String) -> Color {
        return Color(name, bundle: .module)
    }
}

//
//  CGFloat.swift
//  
//
//  Created by Zaheer Moola on 2023/09/24.
//

import Foundation
import Components
import SwiftUI

public extension CGFloat {

    static var pokemonCardWidth: CGFloat {
        UIScreen.screenWidth * 0.45
    }

    static var pokemonCardHeight: CGFloat {
        pokemonCardWidth * 0.6
    }

    static var pokemonCardCornerRadius: CGFloat {
        10
    }

}

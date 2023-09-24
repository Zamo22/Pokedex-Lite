//
//  PokemonInitialViewProvider.swift
//  
//
//  Created by Zaheer Moola on 2023/09/24.
//

import Core
import SwiftUI

struct PokemonInitialViewProvider: InitialViewProvider {

    func provide() -> AnyView {
        AnyView(PokemonListView())
    }

}

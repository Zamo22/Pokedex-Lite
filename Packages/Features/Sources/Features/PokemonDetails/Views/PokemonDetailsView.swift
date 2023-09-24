//
//  PokemonDetailsView.swift
//  
//
//  Created by Zaheer Moola on 2023/09/24.
//

import SwiftUI

struct PokemonDetailsView: View {

    @StateObject
    var viewModel: PokemonDetailsViewModel

    init(pokemon: Pokemon) {
        self._viewModel = StateObject(
            wrappedValue: PokemonDetailsViewModel(pokemon: pokemon))
    }

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PokemonDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailsView(pokemon: .example)
    }
}

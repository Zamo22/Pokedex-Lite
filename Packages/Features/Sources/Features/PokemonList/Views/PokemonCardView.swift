//
//  PokemonCardView.swift
//  
//
//  Created by Zaheer Moola on 2023/09/24.
//

import SwiftUI

struct PokemonCardView: View {

    @StateObject
    var viewModel: PokemonCardViewModel

    init(pokemon: PokemonListItem) {
        self._viewModel = StateObject(
            wrappedValue: PokemonCardViewModel(pokemon: pokemon))
    }

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PokemonCardView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCardView(pokemon: .example)
    }
}

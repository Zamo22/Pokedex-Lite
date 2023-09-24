//
//  PokemonListView.swift
//  
//
//  Created by Zaheer Moola on 2023/09/24.
//

import SwiftUI
import Components

struct PokemonListView: View {

    @StateObject
    var viewModel = PokemonListViewModel()

    private let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        LoadableView($viewModel.pokemonList) {
            list in
            gridView(using: list)
        }
        .task(viewModel.fetchPokemonList)
    }

    func gridView(using list: [PokemonListItem]) -> some View {
        LazyVGrid(columns: columns) {
            ForEach(list) { pokemon in
                PokemonCardView(pokemon: pokemon)
            }
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}

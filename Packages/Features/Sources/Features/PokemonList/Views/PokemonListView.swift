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
    private var viewModel = PokemonListViewModel()

    var body: some View {
        NavigationStack {
            LoadableView($viewModel.pokemonList) { list in
                PokemonListResultsView(pokemonList: list)
            }
            .task(viewModel.fetchPokemonList)
        }.accentColor(.white)
    }
}

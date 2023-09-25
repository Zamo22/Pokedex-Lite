//
//  PokemonListResultsView.swift
//  
//
//  Created by Zaheer Moola on 2023/09/25.
//

import SwiftUI

struct PokemonListResultsView: View {

    @StateObject
    var viewModel: PokemonListResultsViewModel

    init(pokemonList: [PokemonListItem]) {
        self._viewModel = StateObject(wrappedValue: PokemonListResultsViewModel(list: pokemonList))
    }

    private let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        gridView(using: viewModel.searchResults)
    }

    private func gridView(using list: [PokemonListItem]) -> some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(list) { pokemon in
                    PokemonCardView(pokemon: pokemon)
                }
            }
            .padding()
        }
//        .background(Color.gray.opacity(0.2))
        .searchable(text: $viewModel.searchText)
    }
}


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
        NavigationView {
            LoadableView($viewModel.pokemonList) {
                list in
                gridView(using: list)
            }
            .task(viewModel.fetchPokemonList)
        }
    }

    func gridView(using list: [PokemonListItem]) -> some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(list) { pokemon in
                    PokemonCardView(pokemon: pokemon)
                }
            }
            .padding()
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}

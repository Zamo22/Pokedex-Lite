//
//  PokemonCardView.swift
//  
//
//  Created by Zaheer Moola on 2023/09/24.
//

import SwiftUI
import Components

struct PokemonCardView: View {

    @StateObject
    private var viewModel: PokemonCardViewModel

    init(pokemon: PokemonListItem) {
        self._viewModel = StateObject(
            wrappedValue: PokemonCardViewModel(pokemon: pokemon))
    }

    var body: some View {
        LoadableView($viewModel.pokemonDetails) { pokemon in
            card(for: pokemon)
        } loadingView: {
            LoadingView(loaderSize: 50)
        } errorView: { _ in
            Text("ERROR: TODO")
        }
        .frame(width: .pokemonCardWidth,
               height: .pokemonCardHeight)
        .task(viewModel.fetchPokemonDetails)
    }

    private func card(for pokemon: Pokemon) -> some View {
        NavigationLink(destination: PokemonDetailsView(pokemon: pokemon)) {
            ZStack {
                backgroundCard(
                    color: pokemon.sortedTypes.first?.backgroundColor ?? .gray)

                cardInfo(for: pokemon)
            }
        }
    }

    private func backgroundCard(color: Color) -> some View {
        RoundedRectangle(cornerRadius: .pokemonCardCornerRadius)
            .stroke(.black, lineWidth: 1)
            .background(
                RoundedRectangle(cornerRadius: .pokemonCardCornerRadius)
                    .fill(color)
            )
    }

    private func cardInfo(for pokemon: Pokemon) -> some View {
        HStack(alignment: .bottom, spacing: 8) {
            infoStack(for: pokemon)

            CachedAsyncImage(url: URL(string: pokemon.sprites?.officialArtworkFrontDefault ?? ""),
                             urlCache: .imageCache) { image in
                image.resizable().aspectRatio(contentMode: .fit)
            } placeholder: {
                LoadingView(loaderSize: 20)
            }
        }
        .padding(8)
    }

    private func infoStack(for pokemon: Pokemon) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(pokemon.name.capitalized)
                .foregroundColor(.white)
                .font(.caption)
                .bold()

            ForEach(pokemon.sortedTypes) { type in
                typeCapsule(for: type.rawValue.capitalized)
            }

            Spacer()
        }
    }

    private func typeCapsule(for text: String) -> some View {
        Text(text)
            .foregroundColor(.white)
            .font(.caption2)
            .padding(.horizontal, 4)
            .padding(.vertical, 2)
            .background(Color.white.opacity(0.2))
            .clipShape(Capsule())
    }
}

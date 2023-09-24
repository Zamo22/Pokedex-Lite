//
//  PokemonDetailsView.swift
//  
//
//  Created by Zaheer Moola on 2023/09/24.
//

import SwiftUI
import Components

struct PokemonDetailsView: View {

    @StateObject
    var viewModel: PokemonDetailsViewModel

    init(pokemon: Pokemon) {
        self._viewModel = StateObject(
            wrappedValue: PokemonDetailsViewModel(pokemon: pokemon))
    }

    var body: some View {
        ZStack {
            viewModel.pokemon.sortedTypes.first?.backgroundColor
                .edgesIgnoringSafeArea(.all)

            ScrollView {
                VStack {
                    titleInfo
                    image
                    infoContainer
                }
            }
        }
    }

    private var titleInfo: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 8) {
                Text(viewModel.pokemon.name.capitalized)
                    .foregroundColor(.white)
                    .font(.largeTitle)

                HStack(spacing: 4) {
                    ForEach(viewModel.pokemon.sortedTypes) { type in
                        typeCapsule(type)
                    }
                }
            }

            Spacer()

            Text("\(viewModel.pokemon.formattedId)")
                .foregroundColor(.white)
                .font(.body)
                .bold()
        }
        .padding(16)
    }

    private func typeCapsule(_ type: PokemonType) -> some View {
        Text(type.rawValue.capitalized)
            .foregroundColor(.white)
            .font(.body)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(type.associatedColor)
            .clipShape(Capsule())
    }

    private var image: some View {
        CachedAsyncImage(
            url: URL(string: viewModel.pokemon.sprites?.officialArtworkFrontDefault ?? ""),
            urlCache: .imageCache
        ) { image in
            image.resizable().aspectRatio(contentMode: .fit)
        } placeholder: {
            LoadingView(loaderSize: 20)
        }
    }

    private var infoContainer: some View {
        VStack(spacing: 16) {
            aboutContainer
            statsContainer
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: .pokemonCardCornerRadius)
                .fill(Color.white)
        )
    }

    private var aboutContainer: some View {
        VStack(alignment: .leading) {
            Text("About")
                .font(.title)
                .foregroundColor(.black)
                .padding(.bottom, 4)

            HStack() {
                Text("Height")
                    .foregroundColor(.gray)
                    .font(.body)

                Spacer()

                Text(viewModel.pokemon.heightInMeters)
                    .foregroundColor(.black)
                    .font(.body)
            }

            HStack {
                Text("Weight")
                    .foregroundColor(.gray)
                    .font(.body)

                Spacer()

                Text(viewModel.pokemon.weightInKilograms)
                    .foregroundColor(.black)
                    .font(.body)
            }

            HStack {
                Text("Abilities")
                    .foregroundColor(.gray)
                    .font(.body)

                Spacer()

                Text(viewModel.pokemon.concatenatedAbilities)
                    .foregroundColor(.black)
                    .font(.body)
            }
        }
    }

    private var statsContainer: some View {
        VStack(alignment: .leading) {
            Text("Base Stats")
                .font(.title)
                .foregroundColor(.black)
                .padding(.bottom, 4)

            Grid {
                ForEach(viewModel.pokemon.stats) { stat in
                    GridRow {
                        HStack {
                            Text(stat.name)
                                .foregroundColor(.gray)
                                .font(.body)
                            Spacer()
                        }

                        Text("\(stat.value)")
                            .foregroundColor(.black)
                            .font(.body)

                        PercentageIndicatorView(stat: stat.value)
                    }
                }
            }
        }
    }
}

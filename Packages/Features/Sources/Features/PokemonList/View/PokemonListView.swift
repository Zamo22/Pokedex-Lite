//
//  PokemonListView.swift
//  
//
//  Created by Zaheer Moola on 2023/09/24.
//

import SwiftUI

struct PokemonListView: View {

    @StateObject
    var viewModel = PokemonListViewModel()

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}

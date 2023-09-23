//
//  LoadingView.swift
//  
//
//  Created by Zaheer Moola on 2023/09/23.
//

import SwiftUI
import Lottie

struct LoadingView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                LottieView {
                    try await loadingIndicator()
                }
                .looping()
                .frame(width: 100, height: 100)
                Spacer()
            }
            Spacer()
        }
    }

    func loadingIndicator() async throws -> LottieAnimationSource? {
        try await DotLottieFile.named("pokeballLoading",
                                      bundle: .module).animationSource
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}

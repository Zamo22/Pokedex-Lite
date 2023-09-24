//
//  LoadingView.swift
//  
//
//  Created by Zaheer Moola on 2023/09/23.
//

import SwiftUI
import Lottie

public struct LoadingView: View {

    private let animationSize: CGFloat

    public init(loaderSize: CGFloat = 100) {
        self.animationSize = loaderSize
    }

    public var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                LottieView {
                    try await loadingIndicator()
                }
                .looping()
                .frame(width: animationSize, height: animationSize)
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

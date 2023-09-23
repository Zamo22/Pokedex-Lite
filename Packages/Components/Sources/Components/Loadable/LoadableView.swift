//
//  LoadableView.swift
//  
//
//  Created by Zaheer Moola on 2023/09/23.
//

import SwiftUI

// Note: We could potentially make it so that Error views can be passed here
// if we ever wanted different error views per scenario
public struct LoadableView<Content: View,
                           T>: View {

    @Binding
    var loadable: Loadable<T>

    var contentView: (T) -> Content

    public init(_ loadable: Binding<Loadable<T>>,
                @ViewBuilder contentView: @escaping (T) -> Content) {
        self._loadable = loadable
        self.contentView = contentView
    }

    public var body: some View {
        VStack {
            switch loadable {
            case .loading:
                LoadingView()
                    .disabled(true)
            case .loaded(let result):
                contentView(result)
            case .error(let error):
                ErrorView(message: error.localizedDescription)
            }
        }
    }

}

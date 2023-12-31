//
//  LoadableView.swift
//  
//
//  Created by Zaheer Moola on 2023/09/23.
//

import SwiftUI

public struct LoadableView<Content: View,
                           Loading: View,
                           ErrorContent: View,
                           T>: View {

    @Binding
    var loadable: Loadable<T>

    var contentView: (T) -> Content
    var loadingView: () -> Loading
    var errorView: (Error) -> ErrorContent

    public init(_ loadable: Binding<Loadable<T>>,
                @ViewBuilder contentView: @escaping (T) -> Content,
                @ViewBuilder loadingView: @escaping () -> Loading,
                @ViewBuilder errorView: @escaping (Error) -> ErrorContent) {
        self._loadable = loadable
        self.contentView = contentView
        self.loadingView = loadingView
        self.errorView = errorView
    }

    public var body: some View {
        VStack {
            switch loadable {
            case .loading:
                loadingView()
                    .disabled(true)
            case .loaded(let result):
                contentView(result)
            case .error(let error):
                errorView(error)
            }
        }
    }

}

public extension LoadableView {

    init(_ loadable: Binding<Loadable<T>>,
         @ViewBuilder contentView: @escaping (T) -> Content)
    where Loading == LoadingView,
    ErrorContent == ErrorView {
        self.init(loadable,
                  contentView: contentView,
                  loadingView: { LoadingView() },
                  errorView: { error in ErrorView(message: error.localizedDescription) })
    }

}

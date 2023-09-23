//
//  ContainerView.swift
//  
//
//  Created by Zaheer Moola on 2023/09/23.
//

import SwiftUI
import DependencyContainer

struct ContainerView: View {

    @Injected
    var initialViewProvder: InitialViewProvider

    var body: some View {
        initialViewProvder.provide()
    }

}

//
//  Pokedex_LiteApp.swift
//  Pokedex-Lite
//
//  Created by Zaheer Moola on 2023/09/22.
//

import SwiftUI
import Core
import Features
import Networking

@main
struct Pokedex_LiteApp: App {

    var container = Container(
        moduleRegisterers: [NetworkingDependencyRegisterer(),
                            FeaturesDependencyRegisterer()]
    )

    init() {
        container.initialise()
    }

    var body: some Scene {
        WindowGroup {
            container.view
        }
    }
}

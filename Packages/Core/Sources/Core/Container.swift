//
//  Container.swift
//  
//
//  Created by Zaheer Moola on 2023/09/23.
//

import Foundation
import DependencyContainer
import SwiftUI

public struct Container {
    var container: DependencyContainer
    var moduleRegisterers: [ModuleDependencyRegisterer]

    public init(container: DependencyContainer = .shared,
                moduleRegisterers: [ModuleDependencyRegisterer]) {
        self.container = container
        self.moduleRegisterers = moduleRegisterers
    }

    public func initialise() {
        setUpContainer()
        registerAllModules()
    }

    public var view: some View {
        ContainerView()
    }
}

extension Container {
    func setUpContainer() {
        ManualDependencyResolver.set(resolver: container)
    }

    func registerAllModules() {
        moduleRegisterers.forEach {
            $0.registerDependencies(in: container)
        }
    }
}

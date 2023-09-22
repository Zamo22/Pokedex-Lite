//
//  NetworkingDependencyRegisterer.swift
//  
//
//  Created by Zaheer Moola on 2023/09/23.
//

import DependencyContainer

public struct NetworkingDependencyRegisterer: ModuleDependencyRegisterer {

    public init() {}

    public func registerDependencies(in container: DependencyRegisterer) {
        container.register(EnvironmentProvider.self, creation: PokeApiEnvironmentProvider.init)
        container.register(NetworkingClient.self, creation: NetworkingClientImplementation.init)
    }

}

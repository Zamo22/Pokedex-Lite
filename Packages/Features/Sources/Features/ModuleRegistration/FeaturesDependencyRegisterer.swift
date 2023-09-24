//
//  FeaturesDependencyRegisterer.swift
//  
//
//  Created by Zaheer Moola on 2023/09/24.
//

import DependencyContainer
import Core

public struct FeaturesDependencyRegisterer: ModuleDependencyRegisterer {

    public init() {}

    public func registerDependencies(in container: DependencyRegisterer) {
        container.register(PokemonService.self, creation: PokemonServiceImplementation.init)
        container.register(PokemonListRepository.self, creation: PokemonListRepositoryImplementation.init)
        container.register(InitialViewProvider.self, creation: PokemonInitialViewProvider.init)
        container.register(PokemonDetailsRepository.self,
                           creation: PokemonDetailsRepositoryImplementation.init)
    }

}

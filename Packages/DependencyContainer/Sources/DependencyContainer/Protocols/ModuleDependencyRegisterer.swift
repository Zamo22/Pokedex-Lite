//
//  ModuleDependencyRegisterer.swift
//  
//
//  Created by Zaheer Moola on 2023/09/22.
//

import Foundation

/// Needs to be implemented by each module that has dependencies to register
public protocol ModuleDependencyRegisterer {
    func registerDependencies(in container: DependencyRegisterer)
}

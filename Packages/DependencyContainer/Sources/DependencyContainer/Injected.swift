//
//  Injected.swift
//  
//
//  Created by Zaheer Moola on 2023/09/22.
//

import Foundation

/// A wrapper used to indicate that the specified class should be resolved from the the dependency container
@propertyWrapper public struct Injected<DependencyType> {

    public var wrappedValue: DependencyType { instance }
    private let instance: DependencyType

    public init() {
        instance = ManualDependencyResolver.resolve(DependencyType.self)
    }
}

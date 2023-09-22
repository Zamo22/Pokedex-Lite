//
//  ManualDependencyResolver.swift
//  
//
//  Created by Zaheer Moola on 2023/09/22.
//

import Foundation

public class ManualDependencyResolver {

    private static var instance: DependencyResolver = DependencyContainer.shared

    public static func has<T>(_ dependency: T.Type) -> Bool {
        instance.has(dependency)
    }

    public static func resolve<T>(_ dependency: T.Type) -> T {
        instance.resolve(dependency)
    }

    public static func set(resolver: DependencyResolver) {
        instance = resolver
    }

    public static func reset() {
        instance = DependencyContainer.shared
    }

}

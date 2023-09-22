//
//  Created by Zaheer Moola on 2023/09/22.
//

import Foundation

public protocol DependencyRegisterer {
    func register<T>(_ dependency: T.Type, creation: @escaping () -> T)
}

public protocol DependencyResolver {
    func has<T>(_ dependency: T.Type) -> Bool
    func resolve<T>(_ dependency: T.Type) -> T
}

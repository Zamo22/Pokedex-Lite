import Foundation

// Note: I considered using Swinject here but after realizing that the use case for this project is
// really simple I've decided to go with a custom solution modeled after other examples I've seen
public final class DependencyContainer {
    public static var shared = DependencyContainer()

    private var dependencies: [String: () -> Any] = [:]

    public init() {}
}

extension DependencyContainer: DependencyRegisterer {

    public func register<T>(_ dependency: T.Type, creation: @escaping () -> T) {
        let dependencyKey = key(forType: dependency)
        guard !dependencies.keys.contains(dependencyKey) else {
            preconditionFailure("\(dependencyKey) is already registered in container.")
        }

        dependencies[dependencyKey] = creation
    }

}

extension DependencyContainer: DependencyResolver {

    public func has<T>(_ dependency: T.Type) -> Bool {
        let dependencyKey = key(forType: dependency)
        return dependencies.keys.contains(dependencyKey)
    }

    public func resolve<T>(_ dependency: T.Type) -> T {
        let dependencyKey = key(forType: dependency)

        guard let dependencyMethod = dependencies[dependencyKey] else {
            preconditionFailure("\(dependencyKey) is not registered in the container.")
        }

        guard let instance = dependencyMethod() as? T else {
            preconditionFailure("\(dependencyKey) registration creates an invalid dependency.")
        }

        return instance
    }

}

private extension DependencyContainer {
    func key<T>(forType type: T.Type) -> String {
        String(describing: type)
    }
}

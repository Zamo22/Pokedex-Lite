import XCTest
import DependencyContainer

open class PokedexTestCase: XCTestCase {

    open var mockDependencyContainer: DependencyContainer!

    open override func setUpWithError() throws {
        mockDependencyContainer = DependencyContainer()
        ManualDependencyResolver.set(resolver: mockDependencyContainer)
    }

    open override func tearDownWithError() throws {
        ManualDependencyResolver.reset()
    }
}

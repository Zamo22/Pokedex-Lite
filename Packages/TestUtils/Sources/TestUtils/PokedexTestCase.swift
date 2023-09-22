import XCTest
import DependencyContainer

public class PokedexTestCase: XCTestCase {

    public var mockDependencyContainer: DependencyContainer!

    public override func setUpWithError() throws {
        mockDependencyContainer = DependencyContainer()
        ManualDependencyResolver.set(resolver: mockDependencyContainer)
    }

    public override func tearDownWithError() throws {
        ManualDependencyResolver.reset()
    }
}

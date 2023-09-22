import XCTest
@testable import DependencyContainer

final class DependencyContainerTests: XCTestCase {

    var mockDependencyContainer: DependencyContainer!

    override func setUpWithError() throws {
        mockDependencyContainer = DependencyContainer()
        ManualDependencyResolver.set(resolver: mockDependencyContainer)
    }

    override func tearDownWithError() throws {
        ManualDependencyResolver.reset()
    }

    func testThatDependencyContainerResolvesCorrectType() {
        mockDependencyContainer.register(TestProtocol.self) { TestClass() }
        let result = mockDependencyContainer.resolve(TestProtocol.self)
        XCTAssertTrue(result is TestClass)
    }

    func testThatDependencyContainerReturnsTrueWhenContainerHasDependency() {
        mockDependencyContainer.register(TestProtocol.self, creation: TestClass.init)
        let result = mockDependencyContainer.has(TestProtocol.self)
        XCTAssertTrue(result)
    }

    func testThatDependencyContainerReturnsFalseWhenContainerDoesNotHaveDepdency() {
        let result = mockDependencyContainer.has(TestProtocol.self)
        XCTAssertFalse(result)
    }
}

private protocol TestProtocol {}
private class TestClass: TestProtocol {}

//
//  PokemonDetailsRepositoryImplementationTests.swift
//  
//
//  Created by Zaheer Moola on 2023/09/25.
//

import XCTest
import TestUtils
@testable import Features

final class PokemonDetailsRepositoryImplementationTests: PokedexTestCase {

    var serviceUnderTest: PokemonDetailsRepositoryImplementation!
    var mockService: MockPokemonService!

    override func setUpWithError() throws {
        try super.setUpWithError()
        mockService = MockPokemonService()
        mockDependencyContainer.register(PokemonService.self) { self.mockService }
        serviceUnderTest = PokemonDetailsRepositoryImplementation()
    }

    func testFetchingPokemonDetails() async throws {
        mockService.stubbedPokemonResponse = .mock
        let result = try await serviceUnderTest.getPokemonDetails(fromUrl: "testUrl")
        XCTAssertEqual(mockService.url, "testUrl")
        XCTAssertEqual(result, .mock)
    }

    func testFetchingPokemonDetailsWithError() async {
        mockService.stubbedErrorResponse = TestError.general

        do {
            let _ = try await serviceUnderTest.getPokemonDetails(fromUrl: "testUrl")
            XCTFail("Error should be thrown")
        } catch {
            XCTAssertEqual(error as? TestError, TestError.general)
        }
    }

}

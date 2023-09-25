//
//  PokemonListRepositoryImplementationTests.swift
//  
//
//  Created by Zaheer Moola on 2023/09/25.
//

import XCTest
import TestUtils
@testable import Features

final class PokemonListRepositoryImplementationTests: PokedexTestCase {

    var serviceUnderTest: PokemonListRepositoryImplementation!
    var mockService: MockPokemonService!

    override func setUpWithError() throws {
        try super.setUpWithError()
        mockService = MockPokemonService()
        mockDependencyContainer.register(PokemonService.self) { self.mockService }
        serviceUnderTest = PokemonListRepositoryImplementation()
    }

    func testFetchingPokemonListConstructsWithHardcodedParametersMapsToCorrectResponse() async throws {
        let expectedListItems: [PokemonListItem] = [.init(name: "test", url: "testUrl")]
        let stubbedList: PokemonList = .init(
            count: 1, results: expectedListItems)
        mockService.stubbedPokemonListResponse =  stubbedList
        let list = try await serviceUnderTest.getPokemonList()

        XCTAssertEqual(mockService.parameters, [.limit(100)])
        XCTAssertEqual(list, expectedListItems)
    }

    func testFetchingPokemonListWithError() async {
        mockService.stubbedErrorResponse = TestError.general

        do {
            let _ = try await serviceUnderTest.getPokemonList()
            XCTFail("Error should be thrown")
        } catch {
            XCTAssertEqual(error as? TestError, TestError.general)
        }
    }

}

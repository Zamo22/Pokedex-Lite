//
//  PokemonCardViewModelTests.swift
//  
//
//  Created by Zaheer Moola on 2023/09/25.
//

import XCTest
import TestUtils
@testable import Features

final class PokemonCardViewModelTests: PokedexTestCase {

    var serviceUnderTest: PokemonCardViewModel!
    var mockRepo: MockPokemonDetailsRepository!
    var mockPokemonListItem = PokemonListItem(name: "testName", url: "testUrl")

    override func setUpWithError() throws {
        try super.setUpWithError()
        mockRepo = MockPokemonDetailsRepository()
        mockDependencyContainer.register(PokemonDetailsRepository.self) { self.mockRepo }
    }

    func testFetchingPokemonDetailsSetsDetailsWhenDataFetchedSuccessfully() async {
        serviceUnderTest = await PokemonCardViewModel(pokemon: mockPokemonListItem)
        mockRepo.stubbedPokemonResponse = Pokemon.mock
        await serviceUnderTest.fetchPokemonDetails()
        let pokemonDetails = await serviceUnderTest.pokemonDetails
        XCTAssertEqual(mockRepo.url, "testUrl")
        XCTAssertEqual(pokemonDetails, .loaded(Pokemon.mock))
    }

    func testFetchingPokemonDetailsSetsErrorsWhenAnErrorWasThrown() async {
        serviceUnderTest = await PokemonCardViewModel(pokemon: mockPokemonListItem)
        mockRepo.stubbedErrorResponse = TestError.general
        await serviceUnderTest.fetchPokemonDetails()
        let pokemonDetails = await serviceUnderTest.pokemonDetails
        XCTAssertEqual(mockRepo.url, "testUrl")
        XCTAssertEqual(pokemonDetails, .error(TestError.general))
    }

}

//
//  PokemonListViewModelTests.swift
//  
//
//  Created by Zaheer Moola on 2023/09/25.
//

import XCTest
import TestUtils
@testable import Features

final class PokemonListViewModelTests: PokedexTestCase {

    var serviceUnderTest: PokemonListViewModel!
    var mockRepo: MockPokemonListRepository!

    override func setUpWithError() throws {
        try super.setUpWithError()
        mockRepo = MockPokemonListRepository()
        mockDependencyContainer.register(PokemonListRepository.self) { self.mockRepo }
    }

    func testFetchingPokemonListSetsResultsWhenDataFetchedSuccessfully() async {
        serviceUnderTest = await PokemonListViewModel()
        let expectedListResults: [PokemonListItem] = [.init(name: "testPokemon", url: "testUrl")]
        mockRepo.stubbedPokemonListResponse = expectedListResults
        await serviceUnderTest.fetchPokemonList()

        let results = await serviceUnderTest.pokemonList
        XCTAssertEqual(results, .loaded(expectedListResults))
    }

    func testFetchingPokemonListSetsErrorsWhenAnErrorWasThrown() async {
        serviceUnderTest = await PokemonListViewModel()
        mockRepo.stubbedErrorResponse = TestError.general
        await serviceUnderTest.fetchPokemonList()
        let pokemonDetails = await serviceUnderTest.pokemonList
        XCTAssertEqual(pokemonDetails, .error(TestError.general))
    }

}

extension PokemonListItem: Equatable {
    public static func == (lhs: PokemonListItem, rhs: PokemonListItem) -> Bool {
        lhs.id == rhs.id
    }
}

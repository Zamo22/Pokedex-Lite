//
//  PokemonListResultsViewModelTests.swift
//  
//
//  Created by Zaheer Moola on 2023/09/25.
//

import XCTest
import TestUtils
@testable import Features

final class PokemonListResultsViewModelTests: PokedexTestCase {

    var serviceUnderTest: PokemonListResultsViewModel!
    var mockListItems: [PokemonListItem] = [.init(name: "bulbasaur", url: "testUrl"),
                                            .init(name: "ivysaur", url: "testUrl2"),
                                            .init(name: "pikachu", url: "testUrl3")]

    override func setUpWithError() throws {
        try super.setUpWithError()
        serviceUnderTest = PokemonListResultsViewModel(list: mockListItems)
    }

    func testWhenSearchTextIsEmptyThatListIsReturnedAsIs() {
        serviceUnderTest.searchText = ""
        XCTAssertEqual(serviceUnderTest.searchResults, mockListItems)
    }

    func testSearchTextReturnsResultsWhenCriteriaIsMet() {
        serviceUnderTest.searchText = "aur"
        let expectedResult: [PokemonListItem] = [.init(name: "bulbasaur", url: "testUrl"),
                                                 .init(name: "ivysaur", url: "testUrl2")]
        XCTAssertEqual(serviceUnderTest.searchResults, expectedResult)

    }

    func testSearchTextReturnsNothingWhenNoSearchCriteriaIsMet() {
        serviceUnderTest.searchText = "some obscure string"
        XCTAssertEqual(serviceUnderTest.searchResults, [])
    }

}

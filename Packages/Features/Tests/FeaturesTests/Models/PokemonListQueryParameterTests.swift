//
//  PokemonListQueryParameterTests.swift
//  
//
//  Created by Zaheer Moola on 2023/09/25.
//

import XCTest
import TestUtils
@testable import Features

final class PokemonListQueryParameterTests: PokedexTestCase {

    func testLimitReturnsCorrectQueryItem() {
        let expectedQueryItem = URLQueryItem(name: "limit", value: "\(25)")
        let queryitem = PokemonListQueryParameter.limit(25).queryItem
        XCTAssertEqual(expectedQueryItem, queryitem)
    }

    func testOffsetReturnsCorrectQueryItem() {
        let expectedQueryItem = URLQueryItem(name: "offset", value: "\(5)")
        let queryitem = PokemonListQueryParameter.offset(5).queryItem
        XCTAssertEqual(expectedQueryItem, queryitem)
    }

    func testArrayOfQueryParametersMapsCorrectlyToQueryItemArray() {
        let queryParameters: [PokemonListQueryParameter] = [.limit(50), .offset(30)]
        let expectedQueryItems: [URLQueryItem] = [.init(name: "limit", value: "\(50)"),
                                                  .init(name: "offset", value: "\(30)")]
        XCTAssertEqual(queryParameters.queryItems, expectedQueryItems)
    }
}

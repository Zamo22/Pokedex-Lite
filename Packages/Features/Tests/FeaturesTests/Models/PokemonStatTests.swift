//
//  PokemonStatTests.swift
//  
//
//  Created by Zaheer Moola on 2023/09/25.
//

import XCTest
import TestUtils
@testable import Features

final class PokemonStatTests: PokedexTestCase {

    func testValuesMapCorrectly() {
        XCTAssertEqual(PokemonStat.hp(40).value, 40)
        XCTAssertEqual(PokemonStat.attack(50).value, 50)
        XCTAssertEqual(PokemonStat.defense(60).value, 60)
        XCTAssertEqual(PokemonStat.specialAttack(65).value, 65)
        XCTAssertEqual(PokemonStat.specialDefense(70).value, 70)
        XCTAssertEqual(PokemonStat.speed(20).value, 20)
    }

    func testNamesMapCorrectly() {
        XCTAssertEqual(PokemonStat.hp(1).name, "HP")
        XCTAssertEqual(PokemonStat.attack(1).name, "Attack")
        XCTAssertEqual(PokemonStat.defense(1).name, "Defense")
        XCTAssertEqual(PokemonStat.specialAttack(1).name, "Special Attack")
        XCTAssertEqual(PokemonStat.specialDefense(1).name, "Special Defense")
        XCTAssertEqual(PokemonStat.speed(1).name, "Speed")
    }

}

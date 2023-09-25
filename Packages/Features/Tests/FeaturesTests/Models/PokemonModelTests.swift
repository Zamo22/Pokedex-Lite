//
//  PokemonModelTests.swift
//  
//
//  Created by Zaheer Moola on 2023/09/25.
//

import XCTest
import TestUtils
@testable import Features

final class PokemonModelTests: PokedexTestCase {

    func testSortingTypesWhenReceivedInIncorrectOrder() {
        let expectedTypes: [PokemonType] = [.grass, .poison]
        let sortedTypes = Pokemon.mock.sortedTypes
        XCTAssertEqual(expectedTypes, sortedTypes)
    }

    func testFormattedIdAddsSufficientZeros() {
        XCTAssertEqual("#002", Pokemon.mock.formattedId)

        var twoDigitId = Pokemon.mock
        twoDigitId.id = 13
        XCTAssertEqual("#013", twoDigitId.formattedId)

        var threeDigitId = Pokemon.mock
        threeDigitId.id = 123
        XCTAssertEqual("#123", threeDigitId.formattedId)

        var fourDigitId = Pokemon.mock
        fourDigitId.id = 1234
        XCTAssertEqual("#1234", fourDigitId.formattedId)
    }

    func testHeightInMetersConvertsDecimetersToMetersAndFormats() {
        XCTAssertEqual(Pokemon.mock.heightInMeters, "1.0 m")

        var heightWithRemainder = Pokemon.mock
        heightWithRemainder.height = 35
        XCTAssertEqual(heightWithRemainder.heightInMeters, "3.5 m")
    }

    func testWeightInKilogramsConvertsHectogramsToKilogramsAndFormats() {
        XCTAssertEqual(Pokemon.mock.weightInKilograms, "13.0 kg")

        var weightWithRemainder = Pokemon.mock
        weightWithRemainder.weight = 123
        XCTAssertEqual(weightWithRemainder.weightInKilograms, "12.3 kg")
    }

    func testConcatenatedAbilitiesFormatsAllAbilitiesAsASingleString() {
        let expectedAbilityString = "Overgrow, Chlorophyll"
        XCTAssertEqual(Pokemon.mock.concatenatedAbilities, expectedAbilityString)
    }
}

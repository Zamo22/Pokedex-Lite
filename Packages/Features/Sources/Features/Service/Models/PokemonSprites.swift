//
//  PokemonSprites.swift
//  
//
//  Created by Zaheer Moola on 2023/09/24.
//

import Foundation

struct PokemonSprites: Decodable {
    var frontDefault: String?
    var officialArtworkFrontDefault: String?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.frontDefault = try container.decodeIfPresent(String.self, forKey: .frontDefault)
        let officialArtwork = try container.decode(OfficialArtwork.self, forKey: .officialArtwork)
        self.officialArtworkFrontDefault = officialArtwork.frontDefault
    }

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case officialArtwork = "official-artwork"
    }

    private struct OfficialArtwork: Decodable {
        var frontDefault: String?
        
        enum CodingKeys: String, CodingKey {
            case frontDefault = "front_default"
        }
    }
}

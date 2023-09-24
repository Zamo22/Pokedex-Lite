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

    init(frontDefault: String?, officialFrontDefault: String?) {
        self.frontDefault = frontDefault
        self.officialArtworkFrontDefault = officialFrontDefault
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.frontDefault = try container.decodeIfPresent(String.self, forKey: .frontDefault)
        let other = try container.decode(Other.self, forKey: .other)
        self.officialArtworkFrontDefault = other.officialArtwork?.frontDefault
    }

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case other
    }

    private struct Other: Decodable {
        var officialArtwork: OfficialArtwork?

        enum CodingKeys: String, CodingKey {
            case officialArtwork = "official-artwork"
        }
    }

    private struct OfficialArtwork: Decodable {
        var frontDefault: String?
        
        enum CodingKeys: String, CodingKey {
            case frontDefault = "front_default"
        }
    }
}

//
//  PokemonListQueryParameter.swift
//  
//
//  Created by Zaheer Moola on 2023/09/24.
//

import Foundation

enum PokemonListQueryParameter {
    case limit(Int)
    case offset(Int)
}

extension PokemonListQueryParameter {

    var queryItem: URLQueryItem {
        switch self {
        case .limit(let limit):
            return URLQueryItem(name: "limit", value: "\(limit)")
        case .offset(let offset):
            return URLQueryItem(name: "offset", value: "\(offset)")
        }
    }

}

extension Array where Element == PokemonListQueryParameter {

    var queryItems: [URLQueryItem] {
        self.map { $0.queryItem }
    }
    
}

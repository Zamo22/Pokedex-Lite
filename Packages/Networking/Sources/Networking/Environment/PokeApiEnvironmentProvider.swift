//
//  PokeApiEnvironmentProvider.swift
//  
//
//  Created by Zaheer Moola on 2023/09/23.
//

import Foundation

struct PokeApiEnvironmentProvider: EnvironmentProvider {

    func provideBaseURL() -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "pokeapi.co"
        components.path = "/api/v2"
        components.port = 443

        guard let url = components.url else {
            preconditionFailure("Terminating due to failure to construct base URL for environment.")
        }

        return url
    }

}

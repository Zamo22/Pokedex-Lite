//
//  EnvironmentProvider.swift
//  
//
//  Created by Zaheer Moola on 2023/09/23.
//

import Foundation

// This is probably overkill but exists to avoid baking in the Pokeapi URL into the Networking implementation
// The environment could fairly easily be provided from outside the module to make this a reusable networking module
public protocol EnvironmentProvider {
    func provideBaseURL() -> URL
}

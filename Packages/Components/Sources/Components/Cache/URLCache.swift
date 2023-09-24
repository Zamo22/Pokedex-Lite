//
//  URLCache.swift
//  
//
//  Created by Zaheer Moola on 2023/09/24.
//

import Foundation

// Note: These figures can probably be played with a bit for a better experience
public extension URLCache {
    static let imageCache = URLCache(memoryCapacity: 200_000_000,
                                     diskCapacity: 5_000_000_000)
}

//
//  NetworkingClient.swift
//  
//
//  Created by Zaheer Moola on 2023/09/23.
//

import Foundation

// Note: For simplicity purposes, I will not be adding the other REST methods

public protocol NetworkingClient {
    /// GET service call to a particular path.
    /// - Parameter path: Endpoint to execute the GET call. Resolves against the provided base endpoint.
    func get<T: Decodable>(from path: String) async throws -> T

    /// GET service call to a particular path and query parameters.
    /// - Parameter path: Endpoint to execute the GET call. Resolves against the provided base endpoint.
    /// - Parameter queryParameters: Query parameters thats excuted on endpoint
    func get<T: Decodable>(from path: String,
                           with queryParameters: [URLQueryItem]) async throws -> T

    /// GET service call to a particular url. Does not peform any URL construction and simply directly hits the URL
    /// - Parameter urlString: The URL String used to perform the request
    func get<T: Decodable>(fromUrl urlString: String) async throws -> T

    /// POST service call to a particular path with a body.
    /// - Parameters:
    ///   - path: Endpoint to execute the POST call. Resolves against the provided base endpoint.
    ///   - body: The contents of the body of the request.
    func post<T: Encodable, U: Decodable>(to path: String, with body: T) async throws -> U
}

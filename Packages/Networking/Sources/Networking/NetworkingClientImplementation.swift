//
//  NetworkingClientImplementation.swift
//  
//
//  Created by Zaheer Moola on 2023/09/23.
//

import Foundation
import DependencyContainer

class NetworkingClientImplementation: NetworkingClient {

    func get<T>(from path: String) async throws -> T where T : Decodable {
        try await performRestRequest(constructUrlRequest(for: path, restMethod: "GET"))
    }

    func get<T>(from path: String, with queryParameters: [URLQueryItem]) async throws -> T where T : Decodable {
        try await performRestRequest(
            constructUrlRequest(for: path, restMethod: "GET", queryParameters: queryParameters)
        )
    }

    func get<T>(fromUrl urlString: String) async throws -> T where T : Decodable {
        try await performRestRequest(constructUrlRequest(for: urlString))
    }

    func post<T, U>(to path: String, with body: T) async throws -> U where T : Encodable, U : Decodable {
        let bodyData = try JSONEncoder().encode(body)
        return try await performRestRequest(
            constructUrlRequest(for: path, restMethod: "POST", bodyData: bodyData)
        )
    }

}

// MARK: - Constructing URL Request
private extension NetworkingClientImplementation {

    private func constructUrlRequest(
        for path: String,
        restMethod: String,
        queryParameters: [URLQueryItem] = [],
        bodyData: Data? = nil
    ) throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        let fullURL = try constructFullURL(using: url, queryParameters: queryParameters)
        var urlRequest = URLRequest(url: fullURL)
        urlRequest.httpMethod = restMethod
        urlRequest.httpBody = bodyData
        return urlRequest
    }

    private func constructUrlRequest(
        for urlString: String,
        restMethod: String = "GET"
    ) throws -> URLRequest {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = restMethod
        return urlRequest
    }

    private var baseURL: URL {
        let environmentProvider = ManualDependencyResolver.resolve(EnvironmentProvider.self)
        return environmentProvider.provideBaseURL()
    }

    private func constructFullURL(using url: URL, queryParameters: [URLQueryItem]) throws -> URL {
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.queryItems = queryParameters
        guard let fullURL = components?.url else {
            throw URLError(.badURL)
        }
        return fullURL
    }

}

// MARK: - Executing URL Request
private extension NetworkingClientImplementation {

    func performRestRequest<T: Decodable>(_ request: URLRequest) async throws -> T {
        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(T.self, from: data)
    }

}

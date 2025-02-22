//
//  APIError.swift
//  Pokespin
//
//  Created by Montserrat Arroyo on 2/21/25.
//


import Foundation

enum APIError: Error {
    case emptyData
    case wrongEncoding
    case badResponse
    case badStatusCode
}

struct NetworkClient {
    let baseURL = Constants.ApiURL.baseURL.rawValue
    let apiVersion = "api/v2"
    let endpoint = "pokemon"
    
    func requestJSON(pokemonNumber: Int) async throws -> Data {
        guard let url = URL(string: "\(baseURL)/\(apiVersion)/\(endpoint)/\(pokemonNumber)") else { return Data() }
        let urlSession = URLSession(configuration: URLSessionConfiguration.default)
        do {
            let (data, response) = try await urlSession.data(from: url)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw APIError.badResponse }
            return data
        } catch (let error) {
            throw error
        }
    }
}

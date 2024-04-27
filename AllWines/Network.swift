//
//  Network.swift
//  AllWines
//
//  Created by Yery Castro on 10/4/24.
//

import SwiftUI

protocol DataInteractor {
    func getRedsWines() async throws -> [Wine]
    func getWhitesWines() async throws -> [Wine]
    func getRosesWines() async throws -> [Wine]
    func getSparklingWines() async throws -> [Wine]
}
struct Network: DataInteractor {
    func getJSON<JSON>(request: URLRequest, type: JSON.Type) async throws -> JSON where JSON: Codable {
        let (data, response) = try await URLSession.shared.getData(for: request)
        if response.statusCode == 200 {
            do {
                return try JSONDecoder().decode(type, from: data)
            } catch {
                throw NetworkError.json(error)
            }
        } else {
            throw NetworkError.status(response.statusCode)
        }
    }
    
    func postJSON(request: URLRequest, status: Int = 200) async throws {
        let (_, response) = try await URLSession.shared.getData(for: request)
        if response.statusCode != status {
            throw NetworkError.status(response.statusCode)
        }
    }
    func getRedsWines() async throws -> [Wine] {
        try await getJSON(request: .get(url: .urlReds), type: [Wine].self)
    }
    func getWhitesWines() async throws -> [Wine] {
        try await getJSON(request: .get(url: .urlWhites), type: [Wine].self)
    }
    func getRosesWines() async throws -> [Wine] {
        try await getJSON(request: .get(url: .urlRoses), type: [Wine].self)
    }
    func getSparklingWines() async throws -> [Wine] {
        try await getJSON(request: .get(url: .urlSparklings), type: [Wine].self)
    }
}

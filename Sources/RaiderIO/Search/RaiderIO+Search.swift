//
//  RaideRIO+Search.swift
//  RaiderIO
//
//  Created by Sören Gade on 10.03.22.
//

import Foundation

extension RaiderIO {

    private struct SearchResponse: Decodable {

        public let matches: [SearchResult]

    }

    private static let searchPath = "/search"

    public func search(for term: String) async throws -> [SearchResult] {
        let searchUrl = baseUrl.appendingPathComponent(Self.searchPath)
        guard var urlComponents = URLComponents(url: searchUrl, resolvingAgainstBaseURL: true) else {
            throw RaiderIOError.invalidUrlParameters
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "term", value: term)
        ]

        guard let url = urlComponents.url else {
            throw RaiderIOError.invalidUrlParameters
        }

        let response: SearchResponse = try await request(url: url)
        return response.matches
    }

}

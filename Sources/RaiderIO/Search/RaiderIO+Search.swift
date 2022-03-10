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

    private static let searchUrl = URL(string: "https://raider.io/api/search")!

    public func search(for term: String) async throws -> [SearchResult] {
        guard var urlComponents = URLComponents(url: RaiderIO.searchUrl, resolvingAgainstBaseURL: true) else {
            throw Errors.invalidUrlParameters
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "term", value: term)
        ]

        guard let url = urlComponents.url else {
            throw Errors.invalidUrlParameters
        }

        let response: SearchResponse = try await request(url: url)
        return response.matches
    }

}

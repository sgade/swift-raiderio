//
//  RaiderIO.swift
//  RaiderIO
//
//  Created by Sören Gade on 21.02.22.
//


import Foundation


/// Object that allows access to the [Raider.io API](https://raider.io/api).
public class RaiderIO {

    public static let raiderIOBaseUrl = URL(string: "https://raider.io/api")!

    public let baseUrl: URL

    let urlSession: URLSession

    public init(urlSession: URLSession, baseUrl: URL = RaiderIO.raiderIOBaseUrl) {
        self.urlSession = urlSession
        self.baseUrl = baseUrl
    }

}


extension RaiderIO {

    private struct ErrorResponse: Decodable {

        public let statusCode: Int
        public let error: String
        public let message: String

    }

    func request<T>(url: URL) async throws -> T where T: Decodable {
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        let (data, response) = try await urlSession.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw Errors.failedRequest
        }

        let decoder = JSONDecoder()

        guard httpResponse.statusCode == 200 else {
            switch httpResponse.statusCode {
            case 400:
                let errorResponse = try decoder.decode(ErrorResponse.self, from: data)
                throw Errors.server(statusCode: errorResponse.statusCode,
                                    error: errorResponse.error,
                                    message: errorResponse.message)
            default:
                throw Errors.http(statusCode: httpResponse.statusCode)
            }
        }

        return try decoder.decode(T.self, from: data)
    }

}

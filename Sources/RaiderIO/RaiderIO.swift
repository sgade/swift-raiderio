//
//  RaiderIO.swift
//  RaiderIO
//
//  Created by Sören Gade on 21.02.22.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

/// Object that allows access to the [Raider.io API](https://raider.io/api).
public class RaiderIO {

    public let baseUrl: URL

    let client: Client

    let urlSession: URLSession

    public init(urlSession: URLSession) {
        let baseUrl = try! Servers.Server1.url()
        client = Client(
            serverURL: baseUrl,
            transport: URLSessionTransport(configuration: .init(session: urlSession))
        )

        self.baseUrl = baseUrl.appending(path: "/api")
        self.urlSession = urlSession
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
            throw RaiderIOError.failedRequest
        }

        let decoder = JSONDecoder()

        guard httpResponse.statusCode == 200 else {
            switch httpResponse.statusCode {
            case 400:
                let errorResponse = try decoder.decode(ErrorResponse.self, from: data)
                throw RaiderIOError.server(statusCode: errorResponse.statusCode,
                                    error: errorResponse.error,
                                    message: errorResponse.message)
            default:
                throw RaiderIOError.http(statusCode: httpResponse.statusCode)
            }
        }

        return try decoder.decode(T.self, from: data)
    }

    func produce<T>(_ producer: () -> T?) throws -> T {
        guard let value = producer() else {
            throw RaiderIOError.producingFailed
        }
        return value
    }

    func parse<T: Decodable>(
        _ producer: () async throws -> HTTPBody,
        upToBytes size: Int = 50 * 1024 * 1024
    ) async throws -> T {
        let response = try await producer()
        return try await parse(
            response: response,
            upToBytes: size
        )
    }

    private func parse<T: Decodable>(
        response: HTTPBody,
        upToBytes size: Int = 50 * 1024 * 1024
    ) async throws -> T {
        let data = try await Data(collecting: response, upTo: size)

        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }

}

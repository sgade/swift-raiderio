//
//  RaiderIO.swift
//  RaiderIO
//
//  Created by Sören Gade on 21.02.22.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession
import RaiderIOAPI

/// Network client that accesses the [Raider.io API](https://raider.io/api).
public final class RaiderIO: Sendable {

    public let baseUrl: URL

    let client: RaiderIOAPI.Client

    private let urlSession: URLSession

    public init(urlSession: URLSession) {
        let baseUrl = try! Servers.Server1.url()
        client = Client(
            serverURL: baseUrl,
            // The one schema field typed as a real `date-time` (KeystoneRun.completedAt)
            // carries JS-style millisecond timestamps the default `.iso8601` transcoder
            // can't parse. Reuse ISO8601Date's existing lenient parsing instead of
            // `.iso8601WithFractionalSeconds`, which is strict the other way (fails on
            // timestamps *without* fractional seconds).
            configuration: Configuration(dateTranscoder: .raiderIO),
            transport: URLSessionTransport(configuration: .init(session: urlSession))
        )

        self.baseUrl = baseUrl
        self.urlSession = urlSession
    }

}

// MARK: Common methods for making requests

extension RaiderIO {

    func convert<Value: RawRepresentable, T: RawRepresentable>(from value: Value) throws -> T
    where Value.RawValue == T.RawValue {
        guard let newValue = T.init(rawValue: value.rawValue) else {
            throw RaiderIOError.typeConversionFailure
        }
        return newValue
    }

}

// MARK: Manually making a request

extension RaiderIO {

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
                throw RaiderIOError.server(
                    statusCode: errorResponse.statusCode,
                    error: errorResponse.error,
                    message: errorResponse.message)
            default:
                throw RaiderIOError.http(statusCode: httpResponse.statusCode)
            }
        }

        return try decoder.decode(T.self, from: data)
    }

}

// MARK: - ErrorResponse

private struct ErrorResponse: Decodable {

    public let statusCode: Int
    public let error: String
    public let message: String

}

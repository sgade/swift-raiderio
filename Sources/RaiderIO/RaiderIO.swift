//
//  RaiderIO.swift
//  RaiderIO
//
//  Created by Sören Gade on 21.02.22.
//


import Foundation


public class RaiderIO {

    let urlSession: URLSession

    public init(urlSession: URLSession) {
        self.urlSession = urlSession
    }

}


extension RaiderIO {

    func request<T>(url: URL) async throws -> T where T: Decodable {
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        let (data, response) = try await urlSession.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw Errors.failedRequest
        }
        guard httpResponse.statusCode == 200 else {
            throw Errors.http(statusCode: httpResponse.statusCode)
        }

        return try JSONDecoder().decode(T.self, from: data)
    }

}

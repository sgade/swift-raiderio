//
//  SpecialCharacterURL.swift
//  RaiderIO
//
//  Created by Sören Gade on 15.01.23.
//

import Foundation

public struct SpecialCharacterURL {

    /// The unescaped url string with special characters.
    public let string: String

    public init(string: String) {
        self.string = string
    }

}

// MARK: - Escaping for URL-compliant use

public extension SpecialCharacterURL {

    var url: URL? {
        guard let url = URL(string: string) else {
            return escapedUrl
        }
        return url
    }

    private var escapedUrl: URL? {
        guard let escapedString = string.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) else {
            return nil
        }
        return URL(string: escapedString)
    }

}

// MARK: - Codable

extension SpecialCharacterURL: Codable {

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(string)
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)

        self.init(string: string)
    }

}

//
//  URL+SpecialCharacters.swift
//  RaiderIO
//
//  Created by Sören Gade on 15.01.23.
//

import Foundation

struct SpecialCharactersURL {

    enum SpecialCharactersURLParsingError: Error {

        case invalidURLFormat

    }

    public let url: URL

    init(string: String) throws {
        guard let components = URLComponents(string: string),
              let url = components.url
        else {
            throw SpecialCharactersURLParsingError.invalidURLFormat
        }
        self.url = url
    }

}

extension SpecialCharactersURL: Codable {

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        try self.init(string: container.decode(String.self))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(url.absoluteString)
    }

}

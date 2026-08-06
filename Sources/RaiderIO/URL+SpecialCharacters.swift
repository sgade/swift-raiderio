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

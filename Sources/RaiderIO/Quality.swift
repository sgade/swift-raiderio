//
//  Quality.swift
//  RaiderIO
//
//  Created by Sören Gade on 10.03.22.
//

import Foundation

public enum Quality: Int {

    // Source: https://wowpedia.fandom.com/wiki/Quality

    case poor = 0
    case common
    case uncommon
    case rare
    case epic
    case legendary
    case artifact
    case heirloom
    case wowToken

}

// MARK: - Codable

extension Quality: Codable {}

extension Quality {

    init(_ rawValue: Int) throws {
        guard let value = Quality(rawValue: rawValue) else {
            throw RaiderIOError.typeConversionFailure
        }
        self = value
    }

}

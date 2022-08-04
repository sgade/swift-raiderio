//
//  Covenant.swift
//  RaiderIO
//
//  Created by Sören Gade on 21.02.22.
//

import Foundation

public struct Covenant {

    public let id: Int
    public let name: String
    public let renownLevel: Int

    public init(id: Int, name: String, renownLevel: Int) {
        self.id = id
        self.name = name
        self.renownLevel = renownLevel
    }

}

// MARK: - Codable

extension Covenant: Codable {

    private enum CodingKeys: String, CodingKey {

        case id
        case name
        case renownLevel    = "renown_level"

    }

}

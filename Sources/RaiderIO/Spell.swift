//
//  Spell.swift
//  RaiderIO
//
//  Created by Sören Gade on 10.03.22.
//

import Foundation

public struct Spell {

    public let id: Int
    public let name: String
    public let icon: String
    public let school: Int
    public let rank: Int?

    public init(id: Int, name: String, icon: String, school: Int, rank: Int? = nil) {
        self.id = id
        self.name = name
        self.icon = icon
        self.school = school
        self.rank = rank
    }

}

// MARK: - Codable

extension Spell: Codable {}

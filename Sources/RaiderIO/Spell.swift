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

extension Spell: Codable {

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        icon = try container.decode(String.self, forKey: .icon)
        school = try container.decode(Int.self, forKey: .school)

        do {
            rank = try container.decodeIfPresent(Int.self, forKey: .rank)
        } catch DecodingError.typeMismatch {
            if let stringValue = try container.decodeIfPresent(String.self, forKey: .rank) {
                rank = Int(stringValue)
            } else {
                rank = nil
            }
        }
    }

}

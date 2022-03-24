//
//  Corruption.swift
//  RaiderIO
//
//  Created by Sören Gade on 10.03.22.
//


import Foundation


public struct Corruption {

    public let added: Float
    public let resisted: Float
    public let total: Float
    public let cloakRank: Float?
    public let spells: [Spell]?

    public init(added: Float, resisted: Float, total: Float, cloakRank: Float? = nil, spells: [Spell]? = nil) {
        self.added = added
        self.resisted = resisted
        self.total = total
        self.cloakRank = cloakRank
        self.spells = spells
    }

}

// MARK: - Codable

extension Corruption: Codable {}

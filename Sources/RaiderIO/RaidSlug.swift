//
//  RaidSlug.swift
//  RaiderIO
//
//  Created by Sören Gade on 25.02.22.
//


import Foundation


public struct RaidSlug {

    public let rawValue: String

}

// MARK: - Constants

extension RaidSlug {

    public static let sepulcherOfTheFirstOnes: RaidSlug = "sepulcher-of-the-first-ones"
    public static let sanctumOfDomination: RaidSlug = "sanctum-of-domination"
    public static let castleNathria: RaidSlug = "castle-nathria"
    public static let NyalothaTheWakingCity: RaidSlug = "nyalotha-the-waking-city"
    public static let theEternalPalace: RaidSlug = "the-eternal-palace"
    public static let crucibleOfStorms: RaidSlug = "crucible-of-storms"
    public static let battleOfDazaralor: RaidSlug = "battle-of-dazaralor"
    public static let uldir: RaidSlug = "uldir"
    public static let antorusTheBurningThrone: RaidSlug = "antorus-the-burning-throne"
    public static let tombOfSageras: RaidSlug = "tomb-of-sargeras"
    public static let theNighthold: RaidSlug = "the-nighthold"
    public static let trialOfValor: RaidSlug = "trial-of-valor"
    public static let theEmeraldNightmare: RaidSlug = "the-emerald-nightmare"

}

// MARK: - ExpressibleByStringLiteral

extension RaidSlug: ExpressibleByStringLiteral {

    public init(stringLiteral value: StringLiteralType) {
        self.rawValue = value
    }

}

// MARK: - Equatable

extension RaidSlug {

    public static func == (lhs: RaidSlug, rhs: String) -> Bool {
        lhs.rawValue == rhs
    }

    public static func == (lhs: String, rhs: RaidSlug) -> Bool {
        rhs == lhs
    }

}

// MARK: - Decodable

extension RaidSlug: Decodable {

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.rawValue = try container.decode(String.self)
    }

}

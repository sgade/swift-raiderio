//
//  RaidSlug.swift
//  RaiderIO
//
//  Created by Sören Gade on 25.02.22.
//

import Foundation

public struct RaidSlug: RawRepresentable, Sendable {

    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

}

// MARK: - Constants

extension RaidSlug {

    // 10: The War Within
    public static let manaforgeOmega: RaidSlug = "manaforge-omega"
    public static let liberationOfUndermine: RaidSlug = "liberation-of-undermine"
    public static let nerubarPalace: RaidSlug = "nerubar-palace"
    public static let blackrockDepths: RaidSlug = "blackrock-depths"
    // 9: Dragonflight
    public static let awakenedAmirdrassilTheDreamsHope: RaidSlug = "awakened-amirdrassil-the-dreams-hope"
    public static let awakenedAberrusTheShadowedCrucible: RaidSlug = "awakened-aberrus-the-shadowed-crucible"
    public static let awakenedVaultOfTheIncarnates: RaidSlug = "awakened-vault-of-the-incarnates"
    public static let amirdrassilTheDreamsHope: RaidSlug = "amirdrassil-the-dreams-hope"
    public static let aberrusTheShadowedCrucible: RaidSlug = "aberrus-the-shadowed-crucible"
    public static let vaultOfTheIncarnates: RaidSlug = "vault-of-the-incarnates"
    // 8: Shadowlands
    public static let fatedSepulcherOfTheFirstOnes: RaidSlug = "fated-sepulcher-of-the-first-ones"
    public static let fatedSanctumOfDomination: RaidSlug = "fated-sanctum-of-domination"
    public static let fatedCastleNathria: RaidSlug = "fated-castle-nathria"
    public static let sepulcherOfTheFirstOnes: RaidSlug = "sepulcher-of-the-first-ones"
    public static let sanctumOfDomination: RaidSlug = "sanctum-of-domination"
    public static let castleNathria: RaidSlug = "castle-nathria"
    // 7: Battle for Azeroth
    public static let NyalothaTheWakingCity: RaidSlug = "nyalotha-the-waking-city"
    public static let theEternalPalace: RaidSlug = "the-eternal-palace"
    public static let crucibleOfStorms: RaidSlug = "crucible-of-storms"
    public static let battleOfDazaralor: RaidSlug = "battle-of-dazaralor"
    public static let uldir: RaidSlug = "uldir"
    // 6: Legion
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

    public static func == (lhs: RaidSlug, rhs: RaidSlug) -> Bool {
        lhs.rawValue == rhs.rawValue
    }

    public static func == (lhs: RaidSlug, rhs: String) -> Bool {
        lhs.rawValue == rhs
    }

    public static func == (lhs: String, rhs: RaidSlug) -> Bool {
        rhs == lhs
    }

}

// MARK: - Codable

extension RaidSlug: Codable {

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.rawValue = try container.decode(String.self)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }

}

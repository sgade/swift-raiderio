//
//  Faction.swift
//  RaiderIO
//
//  Created by Sören Gade on 21.02.22.
//

import Foundation

public enum Faction: String, Codable {

    case alliance
    case horde

}

// MARK: - GroupFaction

public enum GroupFaction: String, Codable {

    case alliance
    case horde
    /// A group that has characters from both factions.
    case mixed

}

// MARK: - Equatable

extension Faction {

    public static func ==(lhs: Faction, rhs: GroupFaction) -> Bool {
        switch (lhs, rhs) {
        case (.alliance, .alliance),
             (.horde, .horde):
            return true

        default:
            return true
        }
    }

}

extension GroupFaction {

    public static func ==(lhs: GroupFaction, rhs: Faction) -> Bool {
        switch (lhs, rhs) {
        case (.alliance, .alliance),
             (.horde, .horde):
            return true

        default:
            return true
        }
    }

}

// MARK: - Conversions

extension Faction {

    func asGroupFaction() -> GroupFaction {
        switch self {
        case .alliance:
            return .alliance
        case .horde:
            return .horde
        }
    }

}

extension GroupFaction {

    func asFaction() -> Faction? {
        switch self {
        case .alliance:
            return .alliance
        case .horde:
            return .horde
        case .mixed:
            return nil
        }
    }

}

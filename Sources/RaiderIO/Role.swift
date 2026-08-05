//
//  Role.swift
//  RaiderIO
//
//  Created by Sören Gade on 10.03.22.
//

import Foundation

public enum Role {

    case tank
    case healer
    case dps

}

// MARK: - Codable

extension Role: Codable {

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        let rawValue = try container.decode(String.self)
        try self.init(string: rawValue)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        var rawValue: String
        switch self {
        case .tank: rawValue = "tank"
        case .healer: rawValue = "healer"
        case .dps: rawValue = "dps"
        }

        try container.encode(rawValue)
    }

}

// MARK: - Parsing

extension Role {

    /// Parses a role from a raw string value. The live API is known to send `"healing"` as an
    /// alias for `"healer"` in some places, in addition to the documented `"tank"`/`"healer"`/`"dps"`.
    init(string rawValue: String) throws {
        switch rawValue.lowercased() {
        case "tank": self = .tank
        case "healer": self = .healer
        case "healing": self = .healer
        case "dps": self = .dps
        default: throw RaiderIOError.typeConversionFailure
        }
    }

}

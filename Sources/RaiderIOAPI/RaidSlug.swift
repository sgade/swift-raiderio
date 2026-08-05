//
//  RaidSlug.swift
//  RaiderIOAPI
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

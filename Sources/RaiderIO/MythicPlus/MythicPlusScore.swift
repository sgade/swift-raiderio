//
//  MythicPlusScore.swift
//  RaiderIO
//
//  Created by Sören Gade on 16.08.22.
//

import Foundation

public struct MythicPlusScore {

    /// The exact score value.
    public var value: Double

    public init(_ value: Double) {
        self.value = value
    }

}

// MARK: - ExpressibleByFloatLiteral

extension MythicPlusScore: ExpressibleByFloatLiteral {

    public init(floatLiteral value: FloatLiteralType) {
        self.init(value)
    }

}

// MARK: - ExpressibleByIntegerLiteral

extension MythicPlusScore: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: IntegerLiteralType) {
        self.init(Double(value))
    }

}

// MARK: - Operators

extension MythicPlusScore {

    // MARK: Multiply

    public static func * (lhs: Self, rhs: Self) -> MythicPlusScore {
        MythicPlusScore(lhs.value * rhs.value)
    }

    public static func * (lhs: Self, rhs: Double) -> MythicPlusScore {
        MythicPlusScore(lhs.value * rhs)
    }

    public static func * (lhs: Double, rhs: Self) -> MythicPlusScore {
        MythicPlusScore(lhs * rhs.value)
    }

    // MARK: Addition

    public static func + (lhs: Self, rhs: Self) -> MythicPlusScore {
        MythicPlusScore(lhs.value + rhs.value)
    }

}

// MARK: - Equatable & Comparable

extension MythicPlusScore: Equatable, Comparable {

    public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.value < rhs.value
    }

}

// MARK: - Codable

extension MythicPlusScore: Codable {

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        value = try container.decode(Double.self)
    }

}

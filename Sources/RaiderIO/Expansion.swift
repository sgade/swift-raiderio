//
//  Expansion.swift
//  RaiderIO
//
//  Created by Sören Gade on 21.02.22.
//


import Foundation


public struct Expansion {

    public let rawValue: Int

}

// MARK: - Constants

extension Expansion {

    public static let legion: Expansion = 6
    public static let battleForAzeroth: Expansion = 7
    public static let shadowlands: Expansion = 8

}

// MARK: - ExpressibleByIntegerLiteral

extension Expansion: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: IntegerLiteralType) {
        self.rawValue = value
    }

}

// MARK: - Decodable

extension Expansion: Decodable {

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.rawValue = try container.decode(Int.self)
    }

}

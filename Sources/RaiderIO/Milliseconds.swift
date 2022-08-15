//
//  Milliseconds.swift
//  
//
//  Created by Sören Gade on 10.03.22.
//

import Foundation

public struct Milliseconds {

    public let duration: TimeInterval

    public init(duration: TimeInterval) {
        self.duration = duration
    }

}

// MARK: - ExpressibleByIntegerLiteral

extension Milliseconds: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: IntegerLiteralType) {
        self.init(duration: TimeInterval(value))
    }

}

// MARK: - ExpressibleByFloatLiteral

extension Milliseconds: ExpressibleByFloatLiteral {

    public init(floatLiteral value: FloatLiteralType) {
        self.init(duration: TimeInterval(value))
    }

}

// MARK: - Codable

extension Milliseconds: Codable {

    private typealias StorageType = Int64

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        let value = try container.decode(StorageType.self)
        duration = Double(value) / 1000.0
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        let value = StorageType(duration * 1000.0)
        try container.encode(value)
    }

}

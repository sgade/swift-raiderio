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

// MARK: - Decodable

extension Milliseconds: Decodable {

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        let ms = try container.decode(Int.self)
        duration = Double(ms) * 1000.0
    }

}

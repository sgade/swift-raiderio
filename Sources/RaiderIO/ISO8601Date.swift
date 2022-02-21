//
//  ISO8601Date.swift
//  RaiderIO
//
//  Created by Sören Gade on 21.02.22.
//


import Foundation


public struct ISO8601Date {

    let value: Date

    public init(_ date: Date) {
        value = date
    }

}

// MARK: - Decodable

extension ISO8601Date: Decodable {

    public enum Errors: Error {

        case invalidDateFormat(String)

    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        var dateString = try container.decode(String.self)

        if let dotIndex = dateString.lastIndex(of: ".") {
            dateString = "\(dateString[dateString.startIndex..<dotIndex])Z"
        }

        let date = try Date(dateString, strategy: .iso8601)
        self.init(date)
    }

}

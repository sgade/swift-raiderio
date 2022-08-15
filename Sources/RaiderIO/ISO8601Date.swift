//
//  ISO8601Date.swift
//  RaiderIO
//
//  Created by Sören Gade on 21.02.22.
//

import Foundation

public struct ISO8601Date {

    public let value: Date

    public init(_ date: Date) {
        value = date
    }

}

// MARK: Parse from (JavaScript) ISO8601 date string

extension ISO8601Date {

    public init(string: String) throws {
        let value = try ISO8601Date.parseDate(from: string)
        self.init(value)
    }

    private static func parseDate(from string: String) throws -> Date {
        var dateString = string
        if let dotIndex = dateString.lastIndex(of: ".") {
            // remove milliseconds before "Z" for some javascript-related reason
            dateString = "\(dateString[dateString.startIndex..<dotIndex])Z"
        }

        var date: Date
        do {
            date = try Date(dateString, strategy: .iso8601)
        } catch let error as NSError {
            guard error.domain == CocoaError.errorDomain,
                  error.code == 2048,
                  dateString.isEmpty
            else {
                throw error
            }

            // NSCocoaErrorDomain: Code 2048 => Cannot parse date
            //  but input is empty, so we fall back
            date = Date.distantPast
        }
        return date
    }

    private static func format(date: Date) -> String {
        let dateString = date.formatted(.iso8601)
        // insert milliseconds before "Z" for some javascript-related reason
        return "\(dateString[dateString.startIndex..<dateString.index(before: dateString.endIndex)]).000Z"
    }

}

// MARK: - Convenience

extension ISO8601Date {

    public static let now = ISO8601Date(.now)

}

// MARK: - Codable

extension ISO8601Date: Codable {

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let dateString = try container.decode(String.self)

        try self.init(string: dateString)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        let dateString = Self.format(date: value)
        try container.encode(dateString)
    }

}

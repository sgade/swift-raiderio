//
//  ISO8601Date.swift
//  RaiderIO
//
//  Created by Sören Gade on 21.02.22.
//

import Foundation
import OpenAPIRuntime

public struct ISO8601Date: Sendable {

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

// MARK: - RaiderIODateTranscoder

extension DateTranscoder where Self == RaiderIODateTranscoder {

    /// Transcodes dates the same way `ISO8601Date` does, reusing its lenient parsing of
    /// Raider.io's JS-style timestamps (which may or may not include fractional seconds).
    static var raiderIO: Self { RaiderIODateTranscoder() }

}

/// A ``DateTranscoder`` for use with `RaiderIOAPI.Client`'s ``Configuration``, so the one
/// schema field typed as a real `date-time` (`KeystoneRun.completedAt`) decodes using the
/// same lenient logic as ``ISO8601Date``, instead of `OpenAPIRuntime`'s default `.iso8601`
/// transcoder (which fails outright on fractional seconds) or `.iso8601WithFractionalSeconds`
/// (which conversely fails on timestamps *without* fractional seconds).
struct RaiderIODateTranscoder: DateTranscoder {

    func encode(_ date: Date) throws -> String {
        try ISO8601DateTranscoder.iso8601WithFractionalSeconds.encode(date)
    }

    func decode(_ dateString: String) throws -> Date {
        try ISO8601Date(string: dateString).value
    }

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

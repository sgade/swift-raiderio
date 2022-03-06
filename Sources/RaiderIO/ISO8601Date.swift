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
        self.init(date)
    }

}

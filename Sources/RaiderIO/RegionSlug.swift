//
//  RegionSlug.swift
//  RaiderIO
//
//  Created by Sören Gade on 25.02.22.
//

import Foundation

public class RegionSlug: ExpressibleByStringLiteral, RawRepresentable, @unchecked Sendable {

    public let rawValue: String

    required public init(rawValue: String) {
        self.rawValue = rawValue
    }

    required public init(stringLiteral value: StringLiteralType) {
        rawValue = value
    }

}

// MARK: - Constants

extension RegionSlug {

    // swiftlint:disable identifier_name
    public static let cn: RegionSlug = "cn"
    public static let eu: RegionSlug = "eu"
    public static let kr: RegionSlug = "kr"
    public static let tw: RegionSlug = "tw"
    public static let us: RegionSlug = "us"
    // swiftlint:enable identifier_name

}

// MARK: - Equatable

extension RegionSlug: Equatable {

    public static func == (lhs: RegionSlug, rhs: RegionSlug) -> Bool {
        lhs.rawValue == rhs.rawValue
    }

    public static func == (lhs: RegionSlug, rhs: String) -> Bool {
        lhs.rawValue == rhs
    }

    public static func == (lhs: String, rhs: RegionSlug) -> Bool {
        rhs == lhs
    }

}

// MARK: - SubRegionSlug

public final class SubRegionSlug: RegionSlug, @unchecked Sendable {}

extension SubRegionSlug {

    public static let world: SubRegionSlug = "world"
    public static let english: SubRegionSlug = "english"
    public static let french: SubRegionSlug = "french"
    public static let german: SubRegionSlug = "german"
    public static let italian: SubRegionSlug = "italian"
    public static let oceanic: SubRegionSlug = "oceanic"
    public static let russian: SubRegionSlug = "russian"
    public static let spanish: SubRegionSlug = "spanish"
    public static let euEnglish: SubRegionSlug = "eu-english"
    public static let euPortuguese: SubRegionSlug = "eu-portuguese"
    public static let euSpanish: SubRegionSlug = "eu-spanish"
    public static let usEnglish: SubRegionSlug = "us-english"
    public static let brazil: SubRegionSlug = "brazil"
    public static let usSpanish: SubRegionSlug = "us-spanish"
    public static let usCentral: SubRegionSlug = "us-central"
    public static let usEastern: SubRegionSlug = "us-eastern"
    public static let usMountain: SubRegionSlug = "us-mountain"
    public static let usPacific: SubRegionSlug = "us-pacific"

}

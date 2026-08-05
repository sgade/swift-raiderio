//
//  RaiderIO+Profile.swift
//  RaiderIO
//
//  Created by Sören Gade on 21.02.22.
//

import Foundation

extension RaiderIO {

    /// Retrieve information about a character.
    ///
    /// - Parameters:
    ///     - region: Name of region to look up character in.
    ///     - realm: Name of realm that character is on. This is in slug format, e.g. `"altar-of-storms"`.
    ///     - name: Name of the character to look up. This is not case sensitive.
    ///     - fields: List of fields to retrieve for this character.
    public func getProfile(
        region: RegionSlug,
        realm: String,
        name: String,
        fields: [ProfileField] = []
    ) async throws -> Profile {
        let fieldsValue: String? = if fields.count > 0 {
            fields.map({ $0.value }).joined(separator: ",")
        } else {
            nil
        }

        switch try await client.getApiV1CharactersProfile(query: .init(
            region: try convert(from: region),
            realm: realm,
            name: name,
            fields: fieldsValue
        )) {
        case .ok(let ok):
            return try Profile(ok.body.json)
        case .undocumented(let statusCode, _):
            throw RaiderIOError.http(statusCode: statusCode)
        }
    }

}

// MARK: - ProfileField

public final class ProfileField: Sendable {

    public let value: String

    private init(value: String) {
        self.value = value
    }

}

extension ProfileField: ExpressibleByStringLiteral {

    public convenience init(stringLiteral value: StringLiteralType) {
        self.init(value: value)
    }

}

extension ProfileField {

    // MARK: General fields

    /// Retrieve high level item information for player.
    public static let gear: ProfileField = "gear"

    // MARK: Raiding fields

    /// Retrieve raid progression data for character.
    public static let raidProgression: ProfileField = "raid_progression"

    // MARK: Mythic Plus fields

    /// Retrieve scores by mythic plus season.
    ///
    /// - Parameters:
    ///     - seasons: You can specify one or more season values to this field.
    ///                You can also use the alias `"current"` and `"previous"` instead of a season name to request that
    ///                relative season.
    ///                Note: Results are returned in an array that matches the order of the seasons in the request.
    public static func mythicPlusScores(by seasons: [String]) -> ProfileField {
        ProfileField(value: "mythic_plus_scores_by_season\( seasons.map({ ":\($0)" }).joined() )")
    }

    /// Retrieve current season mythic plus rankings for player.
    public static let mythicPlusRanks: ProfileField                            = "mythic_plus_ranks"

    /// Retrieve ten most recent mythic plus runs for player (current season only).
    public static let mythicPlusRecentRuns: ProfileField                       = "mythic_plus_recent_runs"

    /// Retrieve ten most high scoring mythic plus runs for player (current season only).
    public static let mythicPlusBestRuns = mythicPlusBestRuns(all: false)
    /// Retrieve ten most high scoring mythic plus runs for player (current season only).
    ///
    /// - Parameter all: Specify the paramater to retrieve all of a character's best runs for the season.
    public static func mythicPlusBestRuns(all: Bool) -> ProfileField {
        ProfileField(value: "mythic_plus_best_runs\( all ? ":all" : "" )")
    }

    /// Retrieve ten most high scoring mythic plus alternate runs for player (current season only).
    public static let mythicPlusAlternateRuns = mythicPlusAlternateRuns(all: false)
    /// Retrieve ten most high scoring mythic plus alternate runs for player (current season only).
    ///
    /// - Parameter all: Specify the paramater to retrieve all of a character's alternate runs for the season.
    ///                  This is available starting Shadowlands Season 1 Post.
    public static func mythicPlusAlternateRuns(all: Bool) -> ProfileField {
        ProfileField(value: "mythic_plus_alternate_runs\( all ? ":all" : "" )")
    }

    /// Retrieve mythic plus rankings for player.
    public static let previousMythicPlusRanks: ProfileField                    = "previous_mythic_plus_ranks"

}

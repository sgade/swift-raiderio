//
//  RaiderIO+Profile.swift
//  RaiderIO
//
//  Created by Sören Gade on 21.02.22.
//


import Foundation


public final class ProfileField {

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

    /// Retrieve basic information about guild the player is in.
    public static let guild: ProfileField = "guild"

    /// Retrieve the covenant and renown level of the player.
    public static let covenant: ProfileField = "covenant"

    // MARK: Raiding fields

    /// Retrieve raid progression data for character.
    public static let raidProgression: ProfileField = "raid_progression"

    // MARK: Mythic Plus fields

    /// Retrieve scores by mythic plus season.
    ///
    /// - Parameters:
    ///     - seasons: You can specify one or more season values to this field.
    ///                You can also use the alias `"current"` and `"previous"` instead of a season name to request that relative season.
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

    /// Retrieve the player's ten highest Mythic+ runs by Mythic+ level (current season only).
    public static let mythicPlusHighestLevelRuns: ProfileField                 = "mythic_plus_highest_level_runs"

    /// Retrieve the player's ten highest Mythic+ runs by Mythic+ level for the current raid week (current season only).
    public static let mythicPlusWeeklyHighestLevelRuns: ProfileField           = "mythic_plus_weekly_highest_level_runs"

    /// Retrieve the player's ten highest Mythic+ runs by Mythic+ level for the previous raid week (current season only).
    public static let mythicPlusPreviousWeeklyHighestLevelRuns: ProfileField   = "mythic_plus_previous_weekly_highest_level_runs"

    /// Retrieve mythic plus rankings for player.
    public static let previousMythicPlusRanks: ProfileField                    = "previous_mythic_plus_ranks"

    // MARK: Other fields

    /// Retrieve raid achievement meta status for a player.
    ///
    /// - Parameter tiers: This request requires that you specify parameters for the specific tiers you're looking for, e.g. `tier21`.
    public static func raidAchievementMeta(tiers: [String]) -> ProfileField {
        ProfileField(value: "raid_achievement_meta\( tiers.map({ ":\($0)" }).joined() )")
    }

    /// Retrieve AOTC/Cutting Edge achievement status for a given raid slug (or multiple).
    ///
    /// - Parameter raids: The raids to retrieve achivement status for.
    public static func raidAchievementCurve(raids: [RaidSlug]) -> ProfileField {
        ProfileField(value: "raid_achievement_curve\( raids.map({ ":\($0.rawValue)" }).joined() )")
    }

}


extension RaiderIO {

    private static let profileUrl = URL(string: "https://raider.io/api/v1/characters/profile")!

    /// Retrieve information about a character.
    ///
    /// - Parameters:
    ///     - region: Name of region to look up character in.
    ///     - realm: Name of realm that character is on. This is in slug format, e.g. `"altar-of-storms"`.
    ///     - name: Name of the character to look up. This is not case sensitive.
    ///     - fields: List of fields to retrieve for this character.
    public func getProfile(region: RegionSlug,
                           realm: String,
                           name: String,
                           fields: [ProfileField] = []) async throws -> Profile {
        guard var urlComponents = URLComponents(url: RaiderIO.profileUrl, resolvingAgainstBaseURL: true) else {
            throw Errors.invalidUrlParameters
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "region", value: region.rawValue),
            URLQueryItem(name: "realm", value: realm),
            URLQueryItem(name: "name", value: name)
        ]
        if fields.count > 0 {
            urlComponents.queryItems?.append(URLQueryItem(name: "fields", value: fields.map({ $0.value }).joined(separator: ",")))
        }

        guard let url = urlComponents.url else {
            throw Errors.invalidUrlParameters
        }

        return try await request(url: url)
    }

}

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

    public static let gear: ProfileField = "gear"
    public static let guild: ProfileField = "guild"
    public static let covenant: ProfileField = "covenant"

    // MARK: Raiding fields

    public static let raidProgression: ProfileField = "raidProgression"

    // MARK: Mythic Plus fields

    public static func mythicPlusScores(by seasons: [String]) -> ProfileField {
        ProfileField(value: "mythic_plus_scores_by_season\(seasons.map({ ":\($0)" }).joined() )")
    }
    public static let mythicPlusRanks: ProfileField                            = "mythic_plus_ranks"
    public static let mythicPlusRecentRuns: ProfileField                       = "mythic_plus_recent_runs"
    //    case mythicPlusBestRuns                         = "mythic_plus_best_runs"
    //    case mythicPlusAlternateRuns                    = "mythic_plus_alternate_runs"
    public static let mythicPlusHighestLevelRuns: ProfileField                 = "mythic_plus_highest_level_runs"
    public static let mythicPlusPreviousWeeklyHighestLevelRuns: ProfileField   = "mythic_plus_previous_weekly_highest_level_runs"
    public static let previousMythicPlusRanks: ProfileField                    = "previous_mythic_plus_ranks"

    // MARK: Other fields

    //    case raidAchievementMeta                        = "raid_achievement_meta"
    //    case raidAchievementCurve                       = "raid_achievement_curve"

}


extension RaiderIO {

    private static let profileUrl = URL(string: "https://raider.io/api/v1/characters/profile")!

    public func getProfile(region: Region,
                           realm: String,
                           name: String,
                           fields: [ProfileField] = []) async throws -> Profile {
        guard var urlComponents = URLComponents(url: RaiderIO.profileUrl, resolvingAgainstBaseURL: true) else {
            throw Errors.invalidUrlParameters
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "region", value: region.rawValue),
            URLQueryItem(name: "realm", value: realm),
            URLQueryItem(name: "name", value: name),
            URLQueryItem(name: "fields", value: fields.map({ $0.value }).joined(separator: ","))
        ]

        guard let url = urlComponents.url else {
            throw Errors.invalidUrlParameters
        }

        return try await request(url: url)
    }

}

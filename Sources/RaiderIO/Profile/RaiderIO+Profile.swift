//
//  RaiderIO+Profile.swift
//  RaiderIO
//
//  Created by Sören Gade on 21.02.22.
//


import Foundation


public enum ProfileField: String, CaseIterable, Encodable {

    // MARK: General fields

    case gear
    case guild
    case covenant

    // MARK: Raiding fields

    case raidProgression                            = "raid_progression"

    // MARK: Mythic Plus fields

//    case mythicPlusScoresBySeason                   = "mythic_plus_scores_by_season"
    case mythicPlusRanks                            = "mythic_plus_ranks"
    case mythicPlusRecentRuns                       = "mythic_plus_recent_runs"
//    case mythicPlusBestRuns                         = "mythic_plus_best_runs"
//    case mythicPlusAlternateRuns                    = "mythic_plus_alternate_runs"
    case mythicPlusHighestLevelRuns                 = "mythic_plus_highest_level_runs"
    case mythicPlusPreviousWeeklyHighestLevelRuns   = "mythic_plus_previous_weekly_highest_level_runs"
    case previousMythicPlusRanks                    = "previous_mythic_plus_ranks"

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
            URLQueryItem(name: "fields", value: fields.map { $0.rawValue }.joined(separator: ","))
        ]

        guard let url = urlComponents.url else {
            throw Errors.invalidUrlParameters
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")

        let (data, response) = try await urlSession.data(for: urlRequest)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw Errors.failedRequest
        }
        guard httpResponse.statusCode == 200 else {
            throw Errors.http(statusCode: httpResponse.statusCode)
        }

        return try JSONDecoder().decode(Profile.self, from: data)
    }

}

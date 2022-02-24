//
//  RaiderIO+BossKill.swift
//  RaiderIO
//
//  Created by Sören Gade on 22.02.22.
//


import Foundation


extension RaiderIO {

    private static let guildBossKillUrl = URL(string: "https://raider.io/api/v1/guilds/boss-kill")!

    /// Retrieve information about a guild boss kill.
    ///
    /// - Parameters:
    ///     - region: Name of region to look up guild in.
    ///     - realm: Name of realm that guild is on. This is in slug format, e.g. `"altar-of-storms"`.
    ///     - guild: Name of the guild to look up. This is not case sensitive.
    ///     - raid: Raid slug to look up.
    ///     - boss: Boss slug to look up.
    ///     - difficulty: Raid difficulty to look up.
    public func getGuildBossKill(region: RegionSlug,
                                 realm: String,
                                 guildName: String,
                                 raid raidSlug: String,
                                 boss bossSlug: String,
                                 difficulty: Difficulty) async throws -> BossKill? {
        guard var urlComponents = URLComponents(url: RaiderIO.guildBossKillUrl, resolvingAgainstBaseURL: true) else {
            throw Errors.invalidUrlParameters
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "region", value: region.rawValue),
            URLQueryItem(name: "realm", value: realm),
            URLQueryItem(name: "guild", value: guildName),
            URLQueryItem(name: "raid", value: raidSlug),
            URLQueryItem(name: "boss", value: bossSlug),
            URLQueryItem(name: "difficulty", value: difficulty.rawValue)
        ]

        guard let url = urlComponents.url else {
            throw Errors.invalidUrlParameters
        }

        do {
            return try await request(url: url)
        } catch DecodingError.keyNotFound(let codingKey, let context) {
            // when there is no kill recorded, we get back an empty object
            guard (codingKey.stringValue == "kill" || codingKey.stringValue == "roster"),
                  context.codingPath.isEmpty
            else {
                throw DecodingError.keyNotFound(codingKey, context)
            }

            return nil
        }
    }

}

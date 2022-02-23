//
//  RaiderIO+MythicPlusRuns.swift
//  RaiderIO
//
//  Created by Sören Gade on 23.02.22.
//


import Foundation


extension RaiderIO {

    private static let mythicPlusRunsUrl = URL(string: "https://raider.io/api/v1/mythic-plus/runs?season=season-sl-2&region=eu&dungeon=all&page=0")!

    /// Retrieve information about the top runs that match the given criteria.
    ///
    /// - Parameter season: Name of season to request data for.
    /// - Parameter region: Name of region to retrieve runs for.
    /// - Parameter dungeon: Name of dungeon to filter by.
    ///                      This should be the dungeon's slug (e.g. `"eye-of-azshara"`).
    ///                      Use special keyword `"all"` to get the stats across all dungeons.
    /// - Parameter affixes: Name of the affixes to restrict the results to.
    ///                      This will support affix in slug form: `"bolstering-explosive-tyrannical"`.
    ///                      Additionally, you can supply just `"tyrannical"` or `"fortified"` to get the results for any
    ///                      affix combo with that as the final affix.
    ///                      Use the special keyword `"current"` to return the result for the current week's affixes,
    ///                      or `"all"` to retrieve results for all affixes.
    /// - Parameter page: The page number of the results to return.
    public func getMythicPlusRuns(season: String,
                                  region: RegionSlug,
                                  dungeon: String = "all",
                                  affixes: String = "all",
                                  page: Int = 0) async throws -> MythicPlusRuns {
        guard var urlComponents = URLComponents(url: RaiderIO.mythicPlusRunsUrl, resolvingAgainstBaseURL: true) else {
            throw Errors.invalidUrlParameters
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "season", value: season),
            URLQueryItem(name: "region", value: region.rawValue),
            URLQueryItem(name: "dungeon", value: dungeon),
            URLQueryItem(name: "affixes", value: affixes),
            URLQueryItem(name: "page", value: "\(page)")
        ]

        guard let url = urlComponents.url else {
            throw Errors.invalidUrlParameters
        }

        return try await request(url: url)
    }

}

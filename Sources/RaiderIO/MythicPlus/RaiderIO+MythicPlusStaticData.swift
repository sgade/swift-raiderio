//
//  RaiderIO+MythicPlusStaticData.swift
//  RaiderIO
//
//  Created by Sören Gade on 21.02.22.
//

import Foundation

extension RaiderIO {

    /// Retrieve mythic plus season and dungeon static data for a specific expansion (slugs, names, etc.).
    ///
    /// - Parameters:
    ///     - expansion: Expansion to get slugs for.
    public func getStaticMythicPlusData(for expansion: Expansion) async throws -> StaticMythicPlusData {
        switch try await client.getApiV1MythicplusStaticdata(query: .init(expansionId: expansion.rawValue)) {
        case .ok(let ok):
            return try StaticMythicPlusData(ok.body.json)
        case .undocumented(let statusCode, _):
            throw RaiderIOError.http(statusCode: statusCode)
        }
    }

}

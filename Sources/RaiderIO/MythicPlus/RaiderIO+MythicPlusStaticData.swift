//
//  RaiderIO+MythicPlusStaticData.swift
//  RaiderIO
//
//  Created by Sören Gade on 21.02.22.
//


import Foundation


extension RaiderIO {

    private static let mythicPlusStaticDataUrl = URL(string: "https://raider.io/api/v1/mythic-plus/static-data")!

    public func getStaticMythicPlusData(for expansion: Expansion) async throws -> StaticMythicPlusData {
        guard var urlComponents = URLComponents(url: RaiderIO.mythicPlusStaticDataUrl, resolvingAgainstBaseURL: true) else {
            throw Errors.invalidUrlParameters
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "expansion_id", value: "\(expansion.rawValue)")
        ]

        guard let url = urlComponents.url else {
            throw Errors.invalidUrlParameters
        }

        return try await request(url: url)
    }

}

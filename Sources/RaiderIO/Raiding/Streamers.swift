//
//  Streamers.swift
//  RaiderIO
//
//  Created by Sören Gade on 24.02.22.
//


import Foundation


public struct Streamers {

    public let count: Int
//    public let stream: Any?

}


public struct Stream {

    public let id: String
    public let name: String
    public let userId: String
    public let gameId: String
    public let type: String
    public let title: String
    public let communityIds: [Int]
    public let viewerCount: Int
    public let startedAt: ISO8601Date
    public let language: String
    public let thumbnailUrl: URL

}

// MARK: - Decodable

extension Streamers: Decodable {}


extension Stream: Decodable {

    private enum CodingKeys: String, CodingKey {

        case id
        case name
        case userId         = "user_id"
        case gameId         = "game_id"
        case type
        case title
        case communityIds   = "community_ids"
        case viewerCount    = "viewer_count"
        case startedAt      = "started_at"
        case language
        case thumbnailUrl   = "thumbnail_url"

    }

}

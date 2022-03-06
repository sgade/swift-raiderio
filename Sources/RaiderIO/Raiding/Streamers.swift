//
//  Streamers.swift
//  RaiderIO
//
//  Created by Sören Gade on 24.02.22.
//


import Foundation


public struct Streamers {

    public let count: Int
    public let stream: Stream?

    public init(count: Int, stream: Stream? = nil) {
        self.count = count
        self.stream = stream
    }

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

    /// The thumbnail url for the stream.
    ///
    /// The URL contains placeholders for `{width}` and `{height}`.
    public let thumbnailUrl: String

    public init(id: String,
                name: String,
                userId: String,
                gameId: String,
                type: String,
                title: String,
                communityIds: [Int],
                viewerCount: Int,
                startedAt: ISO8601Date,
                language: String,
                thumbnailUrl: String) {
        self.id = id
        self.name = name
        self.userId = userId
        self.gameId = gameId
        self.type = type
        self.title = title
        self.communityIds = communityIds
        self.viewerCount = viewerCount
        self.startedAt = startedAt
        self.language = language
        self.thumbnailUrl = thumbnailUrl
    }

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

//
//  Streamers+RaiderIOAPI.swift
//  RaiderIO
//
//  Created by Sören Gade on 05.08.26.
//

import RaiderIOAPI

extension Streamers {

    init(_ apiModel: Components.Schemas.Streamers) throws {
        guard let count = apiModel.count else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(count: count, stream: try apiModel.stream.map(Stream.init))
    }

}

extension Stream {

    init(_ apiModel: Components.Schemas.Stream1) throws {
        guard let id = apiModel.id,
            let name = apiModel.name,
            let userId = apiModel.userId,
            let gameId = apiModel.gameId,
            let type = apiModel._type,
            let title = apiModel.title,
            let viewerCount = apiModel.viewerCount,
            let startedAt = apiModel.startedAt,
            let language = apiModel.language,
            let thumbnailUrl = apiModel.thumbnailUrl
        else {
            throw RaiderIOError.typeConversionFailure
        }

        self.init(
            id: id,
            name: name,
            userId: userId,
            gameId: gameId,
            type: type,
            title: title,
            communityIds: (apiModel.communityIds ?? []).compactMap(Int.init),
            viewerCount: viewerCount,
            startedAt: try ISO8601Date(string: startedAt),
            language: language,
            thumbnailUrl: thumbnailUrl
        )
    }

}

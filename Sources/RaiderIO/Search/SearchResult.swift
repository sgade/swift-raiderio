//
//  SearchResult.swift
//  RaiderIO
//
//  Created by Sören Gade on 10.03.22.
//


import Foundation


public struct SearchResult {

    public enum ResultType: String {

        case character
        case guild
        case team

    }

    public enum ResultData {

        case character(CharacterSearchResult)
        case guild(GuildSearchResult)
        case team(TeamSearchResult)

    }

    public let type: ResultType
    public let name: String
    public let data: ResultData

    public init(type: ResultType, name: String, data: ResultData) {
        self.type = type
        self.name = name
        self.data = data
    }

}

// MARK: - Decodable

extension SearchResult: Decodable {

    private enum CodingKeys: String, CodingKey {

        case type
        case name
        case data

    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        type = try container.decode(ResultType.self, forKey: .type)
        name = try container.decode(String.self, forKey: .name)

        switch type {
        case .character:
            let result = try container.decode(CharacterSearchResult.self, forKey: .data)
            data = .character(result)
        case .guild:
            let result = try container.decode(GuildSearchResult.self, forKey: .data)
            data = .guild(result)
        case .team:
            let result = try container.decode(TeamSearchResult.self, forKey: .data)
            data = .team(result)
        }
    }

}
extension SearchResult.ResultType: Decodable {}
extension SearchResult.ResultData: Decodable {}

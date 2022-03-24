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

// MARK: - Codable

extension SearchResult: Codable {

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

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(type, forKey: .type)
        try container.encode(name, forKey: .name)

        switch type {
        case .character:
            guard case .character(let characterSearchResult) = data else { break }
            try container.encode(characterSearchResult, forKey: .data)
        case .guild:
            guard case .guild(let guildSearchResult) = data else { break }
            try container.encode(guildSearchResult, forKey: .data)
        case .team:
            guard case .team(let teamSearchResult) = data else { break }
            try container.encode(teamSearchResult, forKey: .data)
        }
    }

}
extension SearchResult.ResultType: Codable {}
extension SearchResult.ResultData: Codable {}

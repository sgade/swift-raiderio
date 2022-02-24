//
//  RaidProgressionEntry.swift
//  RaiderIO
//
//  Created by Sören Gade on 24.02.22.
//


import Foundation


public struct RaidProgressionEntry {

    public let progress: Int
    public let totalGuilds: Int
    public let guilds: [KillGuild]

}

// MARK: - Decodable

extension RaidProgressionEntry: Decodable {}

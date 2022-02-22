//
//  RaidRanking.swift
//  RaiderIO
//
//  Created by Sören Gade on 22.02.22.
//


import Foundation


public struct RaidRanking {

    public let normal: Ranks
    public let heroic: Ranks
    public let mythic: Ranks

}

// MARK: - Decodable

extension RaidRanking: Decodable {}

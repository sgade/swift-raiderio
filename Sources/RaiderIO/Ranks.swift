//
//  Ranks.swift
//  RaiderIO
//
//  Created by Sören Gade on 21.02.22.
//


import Foundation


public struct Ranks {

    public let world: Int
    public let region: Int
    public let realm: Int

    public init(world: Int, region: Int, realm: Int) {
        self.world = world
        self.region = region
        self.realm = realm
    }

}

// MARK: - Decodable

extension Ranks: Decodable {}

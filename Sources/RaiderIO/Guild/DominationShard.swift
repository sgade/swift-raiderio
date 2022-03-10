//
//  DominationShard.swift
//  RaiderIO
//
//  Created by Sören Gade on 10.03.22.
//


import Foundation


public struct DominationShard {

    public let name: String
    public let quality: Quality
    public let icon: String
    public let expansion: Expansion
    public let inventoryType: Int
    public let itemId: Int

    public init(name: String, quality: Quality, icon: String, expansion: Expansion, inventoryType: Int, itemId: Int) {
        self.name = name
        self.quality = quality
        self.icon = icon
        self.expansion = expansion
        self.inventoryType = inventoryType
        self.itemId = itemId
    }

}

// MARK: - Decodable

extension DominationShard: Decodable {

    private enum CodingKeys: String, CodingKey {

        case name
        case quality
        case icon
        case expansion      = "expansionId"
        case inventoryType
        case itemId         = "item_id"

    }

}

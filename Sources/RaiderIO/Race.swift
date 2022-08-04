//
//  Race.swift
//  RaiderIO
//
//  Created by Sören Gade on 10.03.22.
//

import Foundation

public struct Race {

    public let id: Int
    public let name: String
    public let slug: String
    public let faction: Faction

}

// MARK: - Codable

extension Race: Codable {}

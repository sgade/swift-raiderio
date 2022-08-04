//
//  ClassSlug.swift
//  RaiderIO
//
//  Created by Sören Gade on 17.03.22.
//

import Foundation

public enum ClassSlug: String {

    case deathKnight = "death-knight"
    case demonHunter = "demon-hunter"
    case druid
    case hunter
    case mage
    case monk
    case paladin
    case priest
    case rogue
    case shaman
    case warlock
    case warrior

}

// MARK: - Codable

extension ClassSlug: Codable {}

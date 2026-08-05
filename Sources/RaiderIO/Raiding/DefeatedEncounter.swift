//
//  DefeatedEncounter.swift
//  RaiderIO
//
//  Created by Sören Gade on 24.02.22.
//

import Foundation

public struct DefeatedEncounter {

    public let slug: String
    public let lastDefeated: ISO8601Date?
    public let firstDefeated: ISO8601Date?

    public init(slug: String, lastDefeated: ISO8601Date?, firstDefeated: ISO8601Date?) {
        self.slug = slug
        self.lastDefeated = lastDefeated
        self.firstDefeated = firstDefeated
    }

}

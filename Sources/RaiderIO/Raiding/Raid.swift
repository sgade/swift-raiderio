//
//  Raid.swift
//  RaiderIO
//
//  Created by Sören Gade on 22.02.22.
//

import Foundation
import RaiderIOAPI

public struct Raid {

    public struct Encounter {

        public let id: Int
        public let slug: String
        public let name: String

        public init(id: Int, slug: String, name: String) {
            self.id = id
            self.slug = slug
            self.name = name
        }

    }

    public let id: Int
    public let slug: RaidSlug
    public let name: String
    public let shortName: String
    public let encounters: [Encounter]

    public init(id: Int, slug: RaidSlug, name: String, shortName: String, encounters: [Encounter]) {
        self.id = id
        self.slug = slug
        self.name = name
        self.shortName = shortName
        self.encounters = encounters
    }

}

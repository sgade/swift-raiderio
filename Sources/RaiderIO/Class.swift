//
//  Class.swift
//  RaiderIO
//
//  Created by Sören Gade on 10.03.22.
//


import Foundation


public struct Class {

    public let id: Int
    public let name: String
    public let slug: ClassSlug

    public init(id: Int, name: String, slug: ClassSlug) {
        self.id = id
        self.name = name
        self.slug = slug
    }

}

// MARK: - Codable

extension Class: Codable {}

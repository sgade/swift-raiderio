//
//  Guild.swift
//  RaiderIO
//
//  Created by Sören Gade on 21.02.22.
//


import Foundation


public struct Guild {

    public let name: String
    public let realm: String

}

// MARK: - Decodable

extension Guild: Decodable {}

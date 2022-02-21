//
//  Period.swift
//  RaiderIO
//
//  Created by Sören Gade on 21.02.22.
//


import Foundation


public struct Period {

    public let period: Int
    public let start: ISO8601Date
    public let end: ISO8601Date

}

// MARK: - Decodable

extension Period: Decodable {}

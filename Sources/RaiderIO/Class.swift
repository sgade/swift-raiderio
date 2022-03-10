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
    public let slug: String

}

// MARK: - Decodable

extension Class: Decodable {}

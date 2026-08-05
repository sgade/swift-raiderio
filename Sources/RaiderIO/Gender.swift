//
//  Gender.swift
//  RaiderIO
//
//  Created by Sören Gade on 22.02.22.
//

import Foundation

public enum Gender: String, Codable {

    case male
    case female

}

extension Gender {

    init(_ rawValue: String) throws {
        guard let value = Gender(rawValue: rawValue) else {
            throw RaiderIOError.typeConversionFailure
        }
        self = value
    }

}

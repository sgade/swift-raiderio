//
//  RaiderIOError.swift
//  RaiderIO
//
//  Created by Sören Gade on 21.02.22.
//

import Foundation

public enum RaiderIOError: Error {

    case invalidUrlParameters
    case failedRequest
    case http(statusCode: Int)
    case server(statusCode: Int, error: String, message: String)
    case typeConversionFailure

}

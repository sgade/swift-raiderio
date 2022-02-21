//
//  Errors.swift
//  RaiderIO
//
//  Created by Sören Gade on 21.02.22.
//


import Foundation


public enum Errors: Error {

    case invalidUrlParameters
    case failedRequest
    case http(statusCode: Int)
    case server(statusCode: Int, error: String, message: String)

}

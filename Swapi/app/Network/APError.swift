//
//  APError.swift
//  Swapi
//
//  Created by Joel Sene on 29/11/21.
//

import Foundation

enum APError: Error {
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
}

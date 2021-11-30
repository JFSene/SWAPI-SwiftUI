//
//  PlanetResponse.swift
//  Swapi
//
//  Created by Joel Sene on 29/11/21.
//

import Foundation
import Combine

struct PlanetResponse: Codable {
    var next: String
    var results : [Planet]
}

struct VehicleResponse: Codable {
    var next: String
    var results : [Vehicle]
}

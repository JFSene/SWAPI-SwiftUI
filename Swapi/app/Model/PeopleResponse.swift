//
//  PeopleResponse.swift
//  Swapi
//
//  Created by Joel Sene on 29/11/21.
//

import Foundation
import Combine

struct PeopleResponse: Codable {
    var next: String
    var results : [People]
}


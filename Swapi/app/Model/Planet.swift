//
//  Planet.swift
//  Swapi
//
//  Created by Joel Sene on 29/11/21.
//

import Foundation
import Combine

class Planet: Codable, Identifiable {
    var id: UUID
    var name: String
    var climate: String
    var orbital_period: String
    var gravity: String

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = UUID()
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.climate = try container.decodeIfPresent(String.self, forKey: .climate) ?? ""
        self.orbital_period = try container.decodeIfPresent(String.self, forKey: .orbital_period) ?? ""
        self.gravity = try container.decodeIfPresent(String.self, forKey: .gravity) ?? ""
    }
}

class Vehicle: Codable, Identifiable {
    var name: String
    var model: String
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? "NA"
        self.model = try container.decodeIfPresent(String.self, forKey: .model) ?? ""
    }
}

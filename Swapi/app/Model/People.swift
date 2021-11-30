//
//  People.swift
//  Swapi
//
//  Created by Joel Sene on 29/11/21.
//

import Foundation
import Combine

class People: Codable, Identifiable {
    
    var id: UUID
    var name: String
    var height: String
    var mass: String
    var hairColor: String
    var skinColor: String
    var eyeColor: String
    var birthYear: String
    var gender: String
    var homeworld: String
    var films: [String]
    var species: [String]
    var vehicles: [String]
    var starships: [String]
    var created: String
    var edited: String
    var url: String
    
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = UUID()
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.height = try container.decodeIfPresent(String.self, forKey: .height) ?? ""
        self.mass = try container.decodeIfPresent(String.self, forKey: .mass) ?? ""
        self.hairColor = try container.decodeIfPresent(String.self, forKey: .hairColor) ?? ""
        self.skinColor = try container.decodeIfPresent(String.self, forKey: .skinColor) ?? ""
        self.eyeColor = try container.decodeIfPresent(String.self, forKey: .eyeColor) ?? ""
        self.birthYear = try container.decodeIfPresent(String.self, forKey: .birthYear) ?? ""
        self.gender = try container.decodeIfPresent(String.self, forKey: .gender) ?? ""
        self.homeworld = try container.decodeIfPresent(String.self, forKey: .homeworld) ?? ""
        self.films = try container.decodeIfPresent(Array.self, forKey: .films) ?? [""]
        self.species = try container.decodeIfPresent(Array.self, forKey: .species) ?? [""]
        self.vehicles = try container.decodeIfPresent(Array.self, forKey: .vehicles) ?? [""]
        self.starships = try container.decodeIfPresent(Array.self, forKey: .starships) ?? [""]
        self.created = try container.decodeIfPresent(String.self, forKey: .created) ?? ""
        self.edited = try container.decodeIfPresent(String.self, forKey: .edited) ?? ""
        self.url = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
    }
}

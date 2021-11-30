//
//  PlanetLoader.swift
//  Swapi
//
//  Created by Joel Sene on 30/11/21.
//

import Foundation
import SwiftUI

final class PlanetLoader: ObservableObject {
    @Published var planet: Planet?
    @Published var alertItem: AlertItem?
    
    func load(fromURL url: String) {
        NetworkManager.shared.getPlanet(url) { [self] result in
            DispatchQueue.main.async {
                
                switch result {
                case .success(let planet):
                    self.planet = planet
                case .failure(let error):
                    switch error {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    }
                }
            }
        }
    }
}

struct RemotePlanet: View {
    var planet: Planet?
    
    var body: some View {
        Text(planet?.name ?? "NA")
            .font(.body)
            .foregroundColor(.lightTextColor)
    }
}

struct SwapiPlanetLoader: View {
    @StateObject private var planetLoader = PlanetLoader()
    var urlString: String
    
    var body: some View {
        RemotePlanet(planet: planetLoader.planet)
            .onAppear { planetLoader.load(fromURL: urlString)}
            .padding(.bottom, 10)
    }
}

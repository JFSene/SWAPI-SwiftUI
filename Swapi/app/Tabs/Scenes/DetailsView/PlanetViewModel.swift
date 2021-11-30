//
//  PlanetViewModel.swift
//  Swapi
//
//  Created by Joel Sene on 29/11/21.
//

import Foundation

final class PlanetViewModel: ObservableObject {
    @Published var planet: Planet?
    @Published var isLoading = false
    @Published var alertItem: AlertItem?
    
    func getPlanet(_ planetURL: String) {
        NetworkManager.shared.getPlanet(planetURL) { [self] result in
            DispatchQueue.main.async {
                 isLoading = false
                
                switch result {
                case .success(let planet):
                    print(planet)
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

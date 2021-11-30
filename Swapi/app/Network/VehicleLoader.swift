//
//  ImageLoader.swift
//  Swapi
//
//  Created by Joel Sene on 29/11/21.
//

import Foundation
import SwiftUI

final class VehicleLoader: ObservableObject {
    @Published var vehicleArray: Vehicle?
    @Published var alertItem: AlertItem?
    
    func load(fromURL url: String) {
        NetworkManager.shared.getVehicle(url) { [self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let vehicle):
                    self.vehicleArray = vehicle
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

struct RemoteVehicle: View {
    var vehicle: Vehicle?
    
    var body: some View {
        Text(vehicle?.name ?? "NA")
            .font(.body)
            .foregroundColor(.lightTextColor)
    }
}


struct SwapiVehiclesLoader: View {
    @StateObject private var vehicleLoader = VehicleLoader()
    var urlString: String
    
    var body: some View {
        RemoteVehicle(vehicle: vehicleLoader.vehicleArray)
            .onAppear { vehicleLoader.load(fromURL: urlString) }
    }
}

//
//  PeopleListViewModel.swift
//  Swapi
//
//  Created by Joel Sene on 29/11/21.
//

import Foundation

final class PeopleListViewModel: ObservableObject {
    @Published var people: [People] = []
    @Published var language: Language?
    @Published var isLoading = false
    @Published var alertItem: AlertItem?
    @Published var planet: Planet?
    
    func getPeople() {
        isLoading = true
        NetworkManager.shared.getPeople { [self] result in
            DispatchQueue.main.async {
                 isLoading = false
                
                switch result {
                case .success(let peopleArray):
                    self.people = peopleArray
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
    
    func getLanguage(_ url: String) -> String {
        var parsedLanguage: String = ""
        NetworkManager.shared.getLanguage(url) { [self] result in
            DispatchQueue.main.async {
                 isLoading = false
                
                switch result {
                case .success(let language):
                    parsedLanguage = language.language
                    self.language = language
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
        return parsedLanguage
    }
    
}

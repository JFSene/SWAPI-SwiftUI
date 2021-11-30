//
//  LanguageLoader.swift
//  Swapi
//
//  Created by Joel Sene on 30/11/21.
//

import Foundation
import SwiftUI

final class LanguageLoader: ObservableObject {
    @Published var alertItem: AlertItem?
    @Published var languageModel: Language?
    
    func load(fromURL url: String) {
        NetworkManager.shared.getLanguage(url) { [self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let language):
                    self.languageModel = language
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

struct RemoteLanguage: View {
    var language: Language?
    
    var body: some View {
        Text(language?.language ?? "NA")
            .font(.body)
            .foregroundColor(.lightTextColor)
    }
}

struct SwapiLanguageLoader: View {
    @StateObject private var languageLoader = LanguageLoader()
    var urlString: String
    
    var body: some View {
        RemoteLanguage(language: languageLoader.languageModel)
            .onAppear { languageLoader.load(fromURL: urlString)}
            .padding(.bottom, 10)
    }
}

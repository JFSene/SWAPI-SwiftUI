//
//  MoviesLoader.swift
//  Swapi
//
//  Created by Joel Sene on 30/11/21.
//

import Foundation
import SwiftUI

final class MoviesLoader: ObservableObject {
    @Published var movie: Movies?
    @Published var alertItem: AlertItem?
    
    func load(fromURL url: String) {
        NetworkManager.shared.getMovies(url) { [self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let movie):
                    self.movie = movie
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

struct RemoteMovies: View {
    var movie: Movies?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4, content: {
            if let episode = movie?.episode_id,
                  let title = movie?.title {
                ReusableTextView(title: "Episode: \(episode) - \(title)",
                                 font: .body,
                                 fontWeight: .regular,
                                 color: .lightTextColor)
            }
        })
    }
}


struct SwapiMoviesLoader: View {
    @StateObject private var movieLoader = MoviesLoader()
    var urlString: String
    
    var body: some View {
        RemoteMovies(movie: movieLoader.movie)
            .onAppear { movieLoader.load(fromURL: urlString) }
            .padding(.bottom, 5)
    }
}

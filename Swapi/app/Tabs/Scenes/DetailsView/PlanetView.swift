//
//  PlanetView.swift
//  Swapi
//
//  Created by Joel Sene on 29/11/21.
//

import SwiftUI

struct PlanetView: View {
    var planetURL: String
    @StateObject private var viewModel = PlanetViewModel()
    
    var body: some View {
        ZStack {
            HStack {
                Text(viewModel.planet?.name ?? "")
                    .font(.title)
                    .bold()
            }
            .onAppear { viewModel.getPlanet(planetURL) }
            if viewModel.isLoading { LoadingView() }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}


struct PlanetView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetView(planetURL: "https://swapi.dev/api/planets/3/")
            .previewDevice("iPhone SE (2nd generation)")
            .previewLayout(.sizeThatFits)
    }
}

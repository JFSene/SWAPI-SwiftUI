//
//  PeopleListView.swift
//  Swapi
//
//  Created by Joel Sene on 29/11/21.
//

import SwiftUI
import UIKit

let coloredNavAppearance = UINavigationBarAppearance()

struct PeopleListView: View {
    @StateObject private var viewModel = PeopleListViewModel()
    
    init() {
            coloredNavAppearance.configureWithOpaqueBackground()
            coloredNavAppearance.backgroundColor = .secondaryColor
            coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.darkTextColor]
            coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.darkTextColor]
            UINavigationBar.appearance().standardAppearance = coloredNavAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
        }
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.people) { person in 
                    NavigationLink(
                        destination: DetailsView(person: person),
                        label: {
                            HStack {
                                VStack(alignment: .leading) {
                                    CustomCell(person: person)
                                }
                            }
                        }
                    )
                }
                .navigationBarTitle("Star Wars People")
            }
            .onAppear {  viewModel.getPeople() }
            if viewModel.isLoading { LoadingView() }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}


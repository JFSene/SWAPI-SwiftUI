//
//  PeopleListView.swift
//  Swapi
//
//  Created by Joel Sene on 29/11/21.
//

import SwiftUI

struct PeopleListView: View {
    @StateObject private var viewModel = PeopleListViewModel()
    
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
                .buttonStyle(PlainButtonStyle())
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


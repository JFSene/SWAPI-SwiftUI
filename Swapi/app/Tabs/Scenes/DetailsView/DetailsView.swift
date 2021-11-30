//
//  DetailsView.swift
//  Swapi
//
//  Created by Joel Sene on 29/11/21.
//

import SwiftUI

struct DetailsView:View {
    var isLoading = false
    var person: People
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                List {
                    CustomCell(person: person)
                    PlanetView(planetURL: person.homeworld)
                    Text(person.gender)
                        .font(.body)
                        .bold()
                        .padding(10)
                    Text(person.skinColor)
                        .font(.body)
                }
            }
             Spacer()
        }
    }
}


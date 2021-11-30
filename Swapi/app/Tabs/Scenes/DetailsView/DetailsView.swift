//
//  DetailsView.swift
//  Swapi
//
//  Created by Joel Sene on 29/11/21.
//

import SwiftUI

struct DetailsView:View {
    var person: People
    
    var body: some View {
        ZStack {
            List {
                VStack(alignment: .leading, spacing: 0, content: {
                    ReusableTextView(title: "Name", systemImage: "person.fill", font: .title3, fontWeight: .semibold, color: .darkTextColor, paddingValue: 4)
                    ReusableTextView(title: person.name, font: .title, fontWeight: .regular, color: .lightTextColor, paddingValue: 10)
                    
                    ReusableTextView(title: "Gender", systemImage: "person", font: .title3, fontWeight: .semibold, color: .darkTextColor, paddingValue: 4)
                    ReusableTextView(title: person.gender, font: .body, fontWeight: .regular, color: .lightTextColor, paddingValue: 10)

                    
                    ReusableTextView(title: "Home Planet", systemImage: "globe", font: .title3, fontWeight: .semibold, color: .darkTextColor, paddingValue: 4)
                    SwapiPlanetLoader(urlString: person.homeworld)
                    
                    ReusableTextView(title: "Skin Color", systemImage: "person.crop.square", font: .title3, fontWeight: .semibold, color: .darkTextColor, paddingValue: 4)
                    ReusableTextView(title: person.skin_color, font: .body, fontWeight: .regular, color: .lightTextColor, paddingValue: 10)
                    
                })
                ReusableTextView(title: "Movies", systemImage: "list.and.film", font: .title3, fontWeight: .semibold, color: .darkTextColor, paddingValue: 4)
                ForEach(person.films, id: \.self) { movie in
                    SwapiMoviesLoader(urlString: movie)
                }
            }
        }
    }
}


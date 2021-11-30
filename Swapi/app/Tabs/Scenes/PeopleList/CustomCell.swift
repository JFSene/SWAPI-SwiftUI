//
//  CustomCell.swift
//  Swapi
//
//  Created by Joel Sene on 29/11/21.
//

import SwiftUI
import UIKit

struct CustomCell: View {
    var person: People
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0, content: {
                ReusableTextView(title: "Name", systemImage: "person.fill", font: .title3, fontWeight: .semibold, color: .darkTextColor, paddingValue: 4)
                Text(person.name)
                    .font(.title)
                    .foregroundColor(.darkTextColor)
                    .padding(.bottom, 10)
                ReusableTextView(title: "Vehicles", systemImage: "car", font: .title3, fontWeight: .semibold, color: .darkTextColor, paddingValue: 4)
                if !person.vehicles .isEmpty {
                    ForEach(person.vehicles, id: \.self) { vehicle in
                        SwapiVehiclesLoader(urlString: vehicle)
                    }
                }
                ReusableTextView(title: "Languages", systemImage: "captions.bubble", font: .title3, fontWeight: .semibold, color: .darkTextColor, paddingValue: 4)
                if !person.species .isEmpty {
                    ForEach(person.species, id: \.self) { language in
                        SwapiLanguageLoader(urlString: language)
                    }
                } else {
                    Text("N/A")
                        .font(.body)
                        .foregroundColor(.mainColor)
                        .padding(.bottom, 10)
                }
            })
        }
    }
}

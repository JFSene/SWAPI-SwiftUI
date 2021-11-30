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
                HStack {
                    Text("Name")
                        .font(.title3)
                        .foregroundColor(.darkTextColor)
                    Image.init(systemName: "person.fill")
                }
                Text(person.name)
                    .font(.title)
                    .foregroundColor(.darkTextColor)
                    .padding(.bottom, 10)
                if !person.vehicles .isEmpty {
                    HStack {
                        Text("Vehicles")
                            .font(.title3)
                            .foregroundColor(.darkTextColor)
                        Image.init(systemName: "car")
                    }
                }
                ForEach(person.vehicles, id: \.self) { vehicle in
                    SwapiVehiclesLoader(urlString: vehicle)
                }
            })
        }
    }
}

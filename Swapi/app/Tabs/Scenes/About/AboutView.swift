//
//  AboutView.swift
//  Swapi
//
//  Created by Joel Sene on 28/11/21.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            Text("Joel Sene")
                .font(.largeTitle)
                .bold()
                .padding(40)
            Text("09/12/1986")
                .font(.body)
                .padding()
        }
    }
}


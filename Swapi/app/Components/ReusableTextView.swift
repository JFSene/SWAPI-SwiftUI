//
//  ReusableTextView.swift
//  Swapi
//
//  Created by Joel Sene on 30/11/21.
//

import SwiftUI

struct ReusableTextView: View {
    var title: String
    var systemImage: String?
    var font: Font?
    var fontWeight: Font.Weight?
    var color: Color?
    var paddingValue: CGFloat?
    
    var body: some View {
        HStack {
            Text(title)
                .font(font)
                .foregroundColor(color)
                .fontWeight(fontWeight)
                            
            Image.init(systemName: systemImage ?? "")
        }
        .padding(.bottom, paddingValue)
    }
}

struct ReusableTextView_Previews: PreviewProvider {
    static var previews: some View {
        ReusableTextView(title: "Name", systemImage: "person", font: .body, fontWeight: .medium, color: .darkTextColor, paddingValue: 5)
            .previewLayout(.sizeThatFits)
    }
}

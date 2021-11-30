//
//  MainTabView.swift
//  Swapi
//
//  Created by Joel Sene on 28/11/21.
//

import SwiftUI
import UIKit

struct MainTabView: View {
    init() {
        UITabBar.appearance().barTintColor = UIColor.secondaryColor
       }
    
    var body: some View {
        TabView {
            PeopleListView()
                .tabItem {
                    Label("Characters", systemImage: "list.dash")
                }
            
            AboutView()
                .tabItem {
                    Label("About", systemImage: "person.circle")
                }
        }
        .edgesIgnoringSafeArea(.top)
        .accentColor(.darkTextColor)
    }
}

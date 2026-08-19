//
//  MainTabView.swift
//  FindMeals
//
//  Created by Revan Arturito on 19/08/26.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            AboutView()
                .tabItem {
                    Label("About", systemImage: "person")
                }
        }
    }
}

#Preview {
    MainTabView()
}

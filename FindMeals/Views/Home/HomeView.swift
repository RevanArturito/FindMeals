//
//  HomeView.swift
//  FindMeals
//
//  Created by Revan Arturito on 19/08/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Home")
        }
        .padding()
    }
}

#Preview {
    HomeView()
}

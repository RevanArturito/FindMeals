//
//  HomeView.swift
//  FindMeals
//
//  Created by Revan Arturito on 19/08/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            List {
                MealRowView()
                MealRowView()
                MealRowView()
            }
            .navigationTitle("Find Meals")
        }
    }
}

#Preview {
    HomeView()
}

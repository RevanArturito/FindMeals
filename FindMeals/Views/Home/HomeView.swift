//
//  HomeView.swift
//  FindMeals
//
//  Created by Revan Arturito on 19/08/26.
//

import SwiftUI

struct HomeView: View {
    @State private var controller = MealController()
    
    var body: some View {
        NavigationStack {
            Group {
                if controller.isLoading && controller.meals.isEmpty {
                    ProgressView("Loading meals...")
                } else if let error = controller.errorMessage {
                    ContentUnavailableView {
                        Label("Error", systemImage: "exclamationmark.triangle")
                    } description: {
                        Text(error)
                    } actions: {
                        Button("Retry") {
                            Task {
                                await controller.fetchMeals()
                            }
                        }
                        .buttonStyle(.borderedProminent)
                    }
                } else {
                    List(controller.meals) { meal in
                        MealRowView(meal: meal)
                    }
                    .listStyle(.plain)
                    .refreshable {
                        await controller.fetchMeals()
                    }
                }
            }
            .navigationTitle("Find Meals")
            .task {
                await controller.fetchMeals()
            }
        }
    }
}

#Preview {
    HomeView()
}

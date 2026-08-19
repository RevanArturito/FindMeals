//
//  MealDetailView.swift
//  FindMeals
//
//  Created by Revan Arturito on 19/08/26.
//

import SwiftUI

struct MealDetailView: View {
    let mealID: String

    @State private var controller = MealDetailController()
    @State private var isFavorite = false

    var body: some View {
        Group {
            if controller.isLoading {
                ProgressView("Loading meal...")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let error = controller.errorMessage {
                ContentUnavailableView {
                    Label("Something went wrong", systemImage: "exclamationmark.triangle")
                } description: {
                    Text(error)
                } actions: {
                    Button("Retry") {
                        Task { await controller.fetchMealDetail(id: mealID) }
                    }
                    .buttonStyle(.borderedProminent)
                }
            } else if let meal = controller.meal {
                content(for: meal)
            } else {
                ProgressView("Loading meal...")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .task {
            await controller.fetchMealDetail(id: mealID)
        }
    }

    private func content(for meal: MealDetail) -> some View {
        ScrollView {
            VStack(spacing: 0) {
                AsyncImage(url: URL(string: meal.imageURL ?? "")) { phase in
                    switch phase {
                    case .success(let image):
                        image.resizable().scaledToFill()
                    case .empty:
                        Rectangle().fill(Color.gray.opacity(0.15)).overlay(ProgressView())
                    case .failure:
                        Rectangle().fill(Color.gray.opacity(0.15)).overlay(
                            Image(systemName: "fork.knife")
                                .font(.system(size: 40))
                                .foregroundStyle(.secondary)
                        )
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(height: 380)
                .clipped()

                VStack(alignment: .leading, spacing: 24) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 6) {
                            Text(meal.name)
                                .font(.title2.bold())
                        }

                        Spacer()

        
                    }

                    // Category · Country quick line
                    HStack(spacing: 8) {
                        if let category = meal.category {
                            Text(category).fontWeight(.semibold)
                        }
                        if meal.category != nil && meal.country != nil {
                            Text("·").foregroundStyle(.secondary)
                        }
                        if let country = meal.country {
                            Text(country).foregroundStyle(.secondary)
                        }
                    }
                    .font(.subheadline)

                    Divider()

                    // Info section (mirrors Category / Country rows)
                    VStack(spacing: 14) {
                        infoRow(label: "Category", value: meal.category ?? "—")
                        infoRow(label: "Country", value: meal.country ?? "—")
                    }

                    Divider()

                    // Instructions section
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Instructions")
                            .font(.title3.bold())

                        Text(meal.instructions ?? "No instructions available")
                            .font(.body)
                            .foregroundStyle(.secondary)
                            .lineSpacing(6)
                    }
                }
                .padding(24)
                .background(
                    RoundedCorner(radius: 28, corners: [.topLeft, .topRight])
                        .fill(Color(.systemBackground))
                )
                .offset(y: -28)
            }
        }
        .ignoresSafeArea(edges: .top)
    }

    private func infoRow(label: String, value: String, boldLabel: Bool = true) -> some View {
        HStack {
            Text(label)
                .font(.subheadline.weight(boldLabel ? .semibold : .regular))
                .foregroundStyle(boldLabel ? .primary : .secondary)
            Spacer()
            Text(value)
                .font(.subheadline.weight(.semibold))
        }
    }
}

// Helper shape for rounded top corners only
struct RoundedCorner: Shape {
    var radius: CGFloat = 25
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

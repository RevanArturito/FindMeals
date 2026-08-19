//
//  MealRowView.swift
//  FindMeals
//
//  Created by Revan Arturito on 19/08/26.
//

import SwiftUI

struct MealRowView: View {
    let meal: Meal

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: meal.imageURL)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 90, height: 90)
                        .background(Color.gray.opacity(0.1))
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 90, height: 90)
                        .clipped()
                case .failure:
                    Image(systemName: "fork.knife")
                        .resizable()
                        .scaledToFit()
                        .padding(24)
                        .frame(width: 90, height: 90)
                        .foregroundStyle(.secondary)
                        .background(Color.gray.opacity(0.1))
                @unknown default:
                    EmptyView()
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 12))

            VStack(alignment: .leading, spacing: 6) {
                Text(meal.name)
                    .font(.headline)
                    .lineLimit(2)

                Text(meal.area ?? meal.country ?? "Unknown Origin")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer()
        }
        .padding(.leading)
        .padding(.vertical, 8)
    }
}

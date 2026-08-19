//
//  MealRowView.swift
//  FindMeals
//
//  Created by Revan Arturito on 19/08/26.
//

import SwiftUI

struct MealRowView: View {
    var body: some View {
        HStack {
            Image(systemName: "fork.knife")
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .background(Color.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            VStack (alignment: .leading, spacing: 6) {
                Text("Nasi Goreng")
                    .font(.headline)
                Text("Indonesian Food")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            Spacer()
        }
        .padding(.leading)
        .padding(.vertical, 8)
    }
}

#Preview {
    MealRowView()
}

//
//  AboutView.swift
//  FindMeals
//
//  Created by Revan Arturito on 19/08/26.
//

import SwiftUI

struct AboutView: View {
    let name: String = "Revan Arturito"
    let email: String = "revan.arturito@example.com"

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    HStack(spacing: 14) {
                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: [.orange, .pink],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 60, height: 60)
                            .overlay(
                                Text("RA")
                                    .font(.system(size: 60 * 0.36, weight: .bold))
                                    .foregroundStyle(.white)
                            )

                        VStack(alignment: .leading, spacing: 2) {
                            Text(name)
                                .font(.title3.bold())

                            Text(email)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }

                        Spacer()
                    }
                    .padding(16)
                    .background(Color(.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    .padding(.horizontal)
                    .padding(.top, 24)

                    VStack(spacing: 0) {
                        infoRow(icon: "hammer", label: "App", value: "FindMeals")
                        Divider().padding(.leading, 52)
                        infoRow(icon: "number", label: "Version", value: "1.0.0")
                    }
                    .background(Color(.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    .padding(.horizontal)

                    Spacer(minLength: 40)
                }
            }
        }
    }

    private func infoRow(icon: String, label: String, value: String) -> some View {
        HStack(spacing: 14) {
            Image(systemName: icon)
                .font(.system(size: 12, weight: .semibold))
                .foregroundStyle(.orange)
                .frame(width: 28, height: 28)
                .background(Color.orange.opacity(0.15))
                .clipShape(RoundedRectangle(cornerRadius: 8))

            Text(label)
                .font(.subheadline)

            Spacer()

            Text(value)
                .font(.subheadline.weight(.medium))
                .foregroundStyle(.secondary)
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
    }
}

#Preview {
    AboutView()
}

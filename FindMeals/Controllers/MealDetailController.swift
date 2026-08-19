//
//  MealDetailController.swift
//  FindMeals
//
//  Created by Revan Arturito on 19/08/26.
//

import Foundation
import Observation

@Observable
final class MealDetailController {
    private let service = MealService()

    var meal: MealDetail?
    var isLoading = false
    var errorMessage: String?

    func fetchMealDetail(id: String) async {
        isLoading = true
        errorMessage = nil

        defer {
            isLoading = false
        }

        do {
            meal = try await service.fetchMealDetail(id: id)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}

//
//  MealController.swift
//  FindMeals
//
//  Created by Revan Arturito on 19/08/26.
//

import Foundation
import Observation

@Observable
final class MealController {
    private let service = MealService()
    
    var meals: [Meal] = []
    var isLoading: Bool = false
    var errorMessage: String?
    
    func fetchMeals() async {
        isLoading = true
        errorMessage = nil
        
        defer {
            isLoading = false
        }
        
        do {
            let meals = try await service.fetchMeals()
            self.meals = meals
        } catch {
            errorMessage = "Failed to load meals."
        }
    }
}

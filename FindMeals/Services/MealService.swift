//
//  MealService.swift
//  FindMeals
//
//  Created by Revan Arturito on 19/08/26.
//

import Foundation

final class MealService {
    private let baseUrl = "https://www.themealdb.com/api/json/v1/1"
    
    func fetchMeals() async throws -> [Meal] {
        guard let url = URL(string: "\(baseUrl)/filter.php?c=Seafood") else {
            throw URLError(.badURL)
        }
        
        // _ HTTP status
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let response = try JSONDecoder().decode(MealResponse.self, from: data)
        
        return response.meals
    }
}

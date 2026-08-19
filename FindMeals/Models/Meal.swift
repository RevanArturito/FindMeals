//
//  meal.swift
//  FindMeals
//
//  Created by Revan Arturito on 19/08/26.
//

import Foundation

struct Meal: Codable, Identifiable {
    let id: String
    let name: String
    let imageURL: String
    let area: String?
    let country: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case imageURL = "strMealThumb"
        case area = "strArea"
        case country = "strCountry"
    }
}

struct MealResponse: Codable {
    let meals: [Meal]
}

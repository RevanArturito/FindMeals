//
//  MealDetail.swift
//  FindMeals
//
//  Created by Revan Arturito on 19/08/26.
//

struct MealDetail: Codable, Identifiable {
    let id: String
    let name: String
    let category: String?
    let country: String?
    let instructions: String?
    let imageURL: String?

    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case category = "strCategory"
        case country = "strCountry"
        case instructions = "strInstructions"
        case imageURL = "strMealThumb"
    }
}

struct MealDetailResponse: Codable {
    let meals: [MealDetail]
}

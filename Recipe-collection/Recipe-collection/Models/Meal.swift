//
//  Meal.swift
//  Recipe-collection
//
//  Created by sebastian santivanez on 19/10/2026.
//

import Foundation

struct MealResponse: Decodable {
    let meals: [Meal]?
}

struct Meal: Decodable, Identifiable {
    let id: String
    let name: String
    let thumbnail: URL
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case thumbnail = "strMealThumb"
    }
}

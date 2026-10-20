//
//  MealService.swift
//  Recipe-collection
//
//  Created by sebastian santivanez on 19/10/2026.
//

import Foundation

struct MealService {
    private let baseURL = "https://www.themealdb.com/api/json/v1/1"
    
    func searchMeals(query: String) async throws -> [Meal] {
        guard let url = URL(string: "\(baseURL)/search.php?s=\(query)") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(MealResponse.self, from: data)
        return response.meals ?? []
    }
}

//
//  MealListViewModel.swift
//  Recipe-collection
//
//  Created by sebastian santivanez on 19/10/2026.
//

import Foundation

@MainActor
@Observable
class MealListViewModel {
    var meals: [Meal] = []
    private let service = MealService()
    
    func loadMeals() async {
        do {
            meals = try await service.searchMeals(query: "chicken")
        } catch {
            print("Error: \(error)")
        }
    }
}

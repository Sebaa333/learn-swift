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

    func fetchMealDetail(id: String) async throws -> MealDetail {
        guard let url = URL(string: "\(baseURL)/lookup.php?i=\(id)") else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let detailResponse = try JSONDecoder().decode(MealDetailResponse.self, from: data)
        guard let meal = detailResponse.meals?.first else {
            throw URLError(.badServerResponse)
        }
        return meal
    }

    func fetchCategories() async throws -> [CategoryMeal] {
        guard let url = URL(string: "\(baseURL)/categories.php") else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(CategoryResponse.self, from: data)
        return response.categories
    }

    func fetchMeals(category: String) async throws -> [Meal] {
        guard let url = URL(string: "\(baseURL)/filter.php?c=\(category)") else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(MealResponse.self, from: data)
        return response.meals ?? []
    }
}

import Foundation

struct MealResponse: Decodable {
    let meals: [Meal]?
}

struct Meal: Decodable, Identifiable, Hashable {
    let id: String
    let name: String
    let thumbnail: URL

    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case thumbnail = "strMealThumb"
    }
}

import Foundation

struct Ingredient: Identifiable {
    let id = UUID()
    let name: String
    let measure: String
}

struct DynamicCodingKey: CodingKey {
    var stringValue: String
    var intValue: Int?

    init?(stringValue: String) {
        self.stringValue = stringValue
    }

    init?(intValue: Int) {
        return nil
    }
}

struct MealDetail: Decodable, Identifiable {
    let id: String
    let name: String
    let thumbnail: URL
    let category: String?
    let area: String?
    let instructions: String?
    let ingredients: [Ingredient]

    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case thumbnail = "strMealThumb"
        case category = "strCategory"
        case area = "strArea"
        case instructions = "strInstructions"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.thumbnail = try container.decode(URL.self, forKey: .thumbnail)

        self.category = try container.decodeIfPresent(String.self, forKey: .category)
        self.area = try container.decodeIfPresent(String.self, forKey: .area)
        self.instructions = try container.decodeIfPresent(String.self, forKey: .instructions)

        let dynamicContainer = try decoder.container(keyedBy: DynamicCodingKey.self)

        var list: [Ingredient] = []

        for i in 1...20 {
            guard let ingredientKey = DynamicCodingKey(stringValue: "strIngredient\(i)"),
                  let measureKey = DynamicCodingKey(stringValue: "strMeasure\(i)") else {
                continue
            }

            let rawName = try dynamicContainer.decodeIfPresent(String.self, forKey: ingredientKey)
            let rawMeasure = try dynamicContainer.decodeIfPresent(String.self, forKey: measureKey)

            let name = (rawName ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
            let measure = (rawMeasure ?? "").trimmingCharacters(in: .whitespacesAndNewlines)

            if name.isEmpty { continue }

            list.append(Ingredient(name: name, measure: measure))
        }

        self.ingredients = list
    }
}

struct MealDetailResponse: Decodable {
    let meals: [MealDetail]?
}

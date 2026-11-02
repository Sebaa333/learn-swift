import Foundation

struct CategoryResponse: Decodable {
    let categories: [CategoryMeal]
}

struct CategoryMeal: Decodable, Identifiable, Hashable {
    let id: String
    let name: String
    let thumbnail: URL

    enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case name = "strCategory"
        case thumbnail = "strCategoryThumb"
    }
}

import Foundation

@MainActor
@Observable
class MealListViewModel {
    private let service = MealService()
    private var allMeals: [Meal] = []
    var meals: [Meal] = []
    var state: LoadingState = .loading
    var searchText: String = ""
    var categories: [CategoryMeal] = []
    var selectedCategory: CategoryMeal? = nil
    var hasMore: Bool {
        meals.count < allMeals.count
    }
    let pageSize: Int = 10

    func loadMeals() async {
        selectedCategory = nil
        state = .loading
        do {
            let query = searchText.isEmpty ? "chicken" : searchText
            allMeals = try await service.searchMeals(query: query)
            meals = Array(allMeals.prefix(pageSize))

            if meals.isEmpty {
                state = .empty
            } else {
                state = .success
            }
        } catch {
            state = .error
        }
    }

    func loadMore() {
        guard meals.count < allMeals.count else { return }
        guard hasMore else { return }
        meals = Array(allMeals.prefix(meals.count + pageSize))
    }

    func loadCategories() async {
        do {
            categories = try await service.fetchCategories()
        } catch {
            print("Failed to load categories: \(error)")
        }
    }

    func selectCategory(_ category: CategoryMeal) async {
        selectedCategory = category
        state = .loading

        do {
            allMeals = try await service.fetchMeals(category: category.name)
            meals = Array(allMeals.prefix(pageSize))

            if meals.isEmpty {
                state = .empty
            } else {
                state = .success
            }
        } catch {
            state = .error
        }
    }

    func retry() async {
        if let category = selectedCategory {
            await selectCategory(category)
        } else {
            await loadMeals()
        }
    }
}

enum LoadingState {
    case success
    case error
    case loading
    case empty
}

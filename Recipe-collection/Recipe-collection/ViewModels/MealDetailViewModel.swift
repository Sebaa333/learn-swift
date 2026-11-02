import Foundation

@MainActor
@Observable
final class MealDetailViewModel {
    private let service = MealService()
    var meal: MealDetail?

    func loadMeal(id: String) async {
        do {
            meal = try await service.fetchMealDetail(id: id)
        } catch {
            print("Failed to load meal detail: \(error)")
        }
    }
}

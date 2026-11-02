import SwiftData
import SwiftUI

struct MealDetailView: View {
    let mealId: String
    @Environment(\.modelContext) private var context
    @Query private var favorites: [FavoriteMeal]
    @State private var viewModel = MealDetailViewModel()

    private var isFavorite: Bool {
        favorites.contains { $0.id == mealId }
    }

    var body: some View {
        Group {
            if let meal = viewModel.meal {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        AsyncImage(url: meal.thumbnail) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(height: 300)
                        .clipped()

                        VStack(alignment: .leading, spacing: 16) {
                            Text(meal.name)
                                .font(.title)
                                .bold()

                            HStack {
                                if let category = meal.category {
                                    Text(category)
                                }
                                if let area = meal.area {
                                    Text("· \(area)")
                                }
                            }
                            .foregroundStyle(.secondary)

                            Text("Ingredients")
                                .font(.title2)
                                .bold()

                            ForEach(meal.ingredients) { ingredient in
                                HStack {
                                    Text(ingredient.name)
                                    Spacer()
                                    Text(ingredient.measure)
                                        .foregroundStyle(.secondary)
                                }
                            }

                            if let instructions = meal.instructions {
                                Text("Instructions")
                                    .font(.title2)
                                    .bold()

                                Text(instructions)
                            }
                        }
                        .padding()
                    }
                }
                .navigationTitle(meal.name)
                .navigationBarTitleDisplayMode(.inline)
            } else {
                ProgressView()
            }
        }
        .task {
            await viewModel.loadMeal(id: mealId)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    toggleFavorite()
                } label: {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .foregroundStyle(.red)
                }
            }
        }
    }

    private func toggleFavorite() {
        if let existing = favorites.first(where: { $0.id == mealId }) {
            context.delete(existing)
        } else {
            guard let meal = viewModel.meal else { return }
            context.insert(FavoriteMeal(id: mealId, name: meal.name, thumbnail: meal.thumbnail))
        }
    }
}

#Preview {
    NavigationStack {
        MealDetailView(mealId: "52772")
    }
    .modelContainer(for: FavoriteMeal.self, inMemory: true)
}

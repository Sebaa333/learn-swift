import SwiftUI
import SwiftData

struct FavoritesView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \FavoriteMeal.addedAt, order: .reverse) private var favorites: [FavoriteMeal]

    var body: some View {
        NavigationStack {
            Group {
                if favorites.isEmpty {
                    ContentUnavailableView(
                        "No favorites yet",
                        systemImage: "heart",
                        description: Text("Tap the heart on a recipe to save it here.")
                    )
                } else {
                    List {
                        ForEach(favorites) { favorite in
                            NavigationLink {
                                MealDetailView(mealId: favorite.id)
                            } label: {
                                HStack {
                                    AsyncImage(url: favorite.thumbnail) { image in
                                        image
                                            .resizable()
                                            .scaledToFill()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 60, height: 60)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))

                                    Text(favorite.name)
                                }
                            }
                        }
                        .onDelete(perform: delete)
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }

    private func delete(at offsets: IndexSet) {
        for index in offsets {
            context.delete(favorites[index])
        }
    }
}

#Preview {
    FavoritesView()
        .modelContainer(for: FavoriteMeal.self, inMemory: true)
}

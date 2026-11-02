import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            MealListView()
                .tabItem { Label("Recipes", systemImage: "fork.knife") }

            FavoritesView()
                .tabItem { Label("Favorites", systemImage: "heart.fill") }
        }
    }
}

#Preview {
    MainTabView()
        .modelContainer(for: FavoriteMeal.self, inMemory: true)
}

import SwiftUI
import SwiftData

@main
struct Recipe_collectionApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
        .modelContainer(for: FavoriteMeal.self)
    }
}

#Preview {
    MainTabView()
        .modelContainer(for: FavoriteMeal.self, inMemory: true)
}

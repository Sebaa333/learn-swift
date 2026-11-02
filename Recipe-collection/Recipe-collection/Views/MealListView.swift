import SwiftUI

struct MealListView: View {
    @State private var viewModel = MealListViewModel()

    var body: some View {
        NavigationStack {
            Group {
                switch viewModel.state {
                case .loading:
                    if viewModel.meals.isEmpty {
                        ProgressView()
                    } else {
                        mealList
                            .overlay { ProgressView() }
                    }
                case .success:
                    mealList
                case .empty:
                    ContentUnavailableView(
                        "No recipes found",
                        systemImage: "magnifyingglass",
                        description: Text("Try a different search.")
                    )
                case .error:
                    ContentUnavailableView {
                        Label("Something went wrong", systemImage: "exclamationmark.triangle")
                    } description: {
                        Text("We couldn't load the recipes. Check your connection and try again.")
                    } actions: {
                        Button("Try again") {
                            Task {
                                await viewModel.retry()
                            }
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }
            }
            .safeAreaInset(edge: .top) {
                CategoryBarView(
                    categories: viewModel.categories,
                    select: viewModel.selectedCategory,
                    onSelect: { category in
                        Task {
                            await viewModel.selectCategory(category)
                        }
                    }
                )
            }
            .searchable(text: $viewModel.searchText)
            .navigationTitle("Recipes")
            .navigationDestination(for: Meal.self) { meal in
                MealDetailView(mealId: meal.id)
            }
            .task(id: viewModel.searchText) {
                try? await Task.sleep(for: .milliseconds(500))
                guard !Task.isCancelled else { return }
                await viewModel.loadMeals()
            }
            .task {
                await viewModel.loadCategories()
            }
        }
    }

    private var mealList: some View {
        List {
            ForEach(viewModel.meals) { meal in
                NavigationLink(value: meal) {
                    HStack {
                        AsyncImage(url: meal.thumbnail) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 60, height: 60)
                        .clipShape(RoundedRectangle(cornerRadius: 8))

                        Text(meal.name)
                    }
                }
                .onAppear {
                    if meal.id == viewModel.meals.last?.id {
                        viewModel.loadMore()
                    }
                }
            }

            if viewModel.hasMore {
                ProgressView()
                    .frame(maxWidth: .infinity)
            }
        }
    }
}

#Preview {
    MealListView()
        .modelContainer(for: FavoriteMeal.self, inMemory: true)
}

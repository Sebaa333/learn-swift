import SwiftUI

struct CategoryBarView: View {
    let categories: [CategoryMeal]
    let select: CategoryMeal?
    let onSelect: (CategoryMeal) -> Void

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(categories) { category in
                    Button {
                        onSelect(category)
                    } label: {
                        Text(category.name)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .foregroundStyle(category == select ? Color.white : Color.primary)
                            .background(
                                Capsule().fill(category == select ? Color.accentColor : Color.gray.opacity(0.2))
                            )
                    }
                }
            }
            .padding(.horizontal)
        }
        .padding(.vertical, 8)
        .background(.bar)
    }
}

#Preview {
    CategoryBarView(
        categories: [
            CategoryMeal(id: "1", name: "Beef", thumbnail: URL(string: "https://www.themealdb.com/images/category/beef.png")!),
            CategoryMeal(id: "2", name: "Chicken", thumbnail: URL(string: "https://www.themealdb.com/images/category/chicken.png")!),
            CategoryMeal(id: "3", name: "Dessert", thumbnail: URL(string: "https://www.themealdb.com/images/category/dessert.png")!)
        ],
        select: nil,
        onSelect: { _ in }
    )
}

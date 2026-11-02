# Recipe Collection

Recipe Collection is a SwiftUI iOS app for browsing recipes from [TheMealDB](https://www.themealdb.com/). You can search recipes as you type, filter them by category, open a recipe to see its ingredients and instructions, and save favorites on the device with SwiftData.

## Features

- Browse recipes
- Live search with debounce
- Filter by category
- Infinite scroll, paginated locally (TheMealDB has no pagination)
- Recipe detail: image, category, area, ingredients, and instructions
- Favorites persisted with SwiftData, with swipe to delete
- Loading, empty, and error states, with a retry button on errors

## Tech Stack

- Swift
- SwiftUI
- MVVM
- `@Observable`
- async/await
- SwiftData
- TheMealDB API

## Project Structure

```
Recipe-collection/
├── Recipe-collection.xcodeproj
└── Recipe-collection/
    ├── Recipe_collectionApp.swift
    ├── Assets.xcassets
    ├── Models/
    │   ├── Category.swift
    │   ├── FavoriteMeal.swift
    │   ├── Meal.swift
    │   └── MealDetail.swift
    ├── Services/
    │   └── MealService.swift
    ├── ViewModels/
    │   ├── MealDetailViewModel.swift
    │   └── MealListViewModel.swift
    └── Views/
        ├── CategoryBarView.swift
        ├── FavoritesView.swift
        ├── MainTabView.swift
        ├── MealDetailView.swift
        └── MealListView.swift
```

## Screenshots

Screenshots will be added soon.

| List | Detail | Favorites |
| --- | --- | --- |
| ![List](screenshots/list.png) | ![Detail](screenshots/detail.png) | ![Favorites](screenshots/favorites.png) |

## How to Run

1. Clone the repository.
2. Open `Recipe-collection.xcodeproj` in Xcode.
3. Run the app on an iOS 17+ simulator.

No API key is required.

## What I Learned

- MVVM with `@Observable`
- Networking with async/await
- Debounced search with `.task(id:)`
- Local pagination on top of an API that returns every result at once
- Persistence with SwiftData

## Credits

Recipe data and images are provided by [TheMealDB](https://www.themealdb.com/).

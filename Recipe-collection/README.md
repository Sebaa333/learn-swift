# Recipe Collection

Recipe Collection es una app de iOS hecha con SwiftUI para explorar recetas de [TheMealDB](https://www.themealdb.com/). Permite buscar recetas mientras escribís, filtrarlas por categoría, abrir una receta para ver sus ingredientes e instrucciones, y guardar favoritas en el dispositivo con SwiftData.

## Funcionalidades

- Explorar recetas
- Búsqueda en vivo con debounce
- Filtro por categoría
- Scroll infinito con paginación local (TheMealDB no tiene paginación)
- Detalle de la receta: imagen, categoría, origen, ingredientes e instrucciones
- Favoritos guardados con SwiftData, con swipe para borrar
- Estados de carga, vacío y error, con botón para reintentar

## Tecnologías

- Swift
- SwiftUI
- MVVM
- `@Observable`
- async/await
- SwiftData
- API de TheMealDB

## Estructura del proyecto

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

## Capturas

Las capturas se van a agregar pronto.

| Listado | Detalle | Favoritos |
| --- | --- | --- |
| ![Listado](screenshots/list.png) | ![Detalle](screenshots/detail.png) | ![Favoritos](screenshots/favorites.png) |

## Cómo correrla

1. Cloná el repositorio.
2. Abrí `Recipe-collection.xcodeproj` en Xcode.
3. Corré la app en un simulador con iOS 17 o superior.

No hace falta ninguna API key.

## Qué aprendí

- MVVM con `@Observable`
- Llamadas de red con async/await
- Búsqueda con debounce usando `.task(id:)`
- Paginación local sobre una API que devuelve todos los resultados de una vez
- Persistencia con SwiftData

## Créditos

Los datos y las imágenes de las recetas son de [TheMealDB](https://www.themealdb.com/).

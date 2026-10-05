//
//  Shopping_ListApp.swift
//  Shopping-List
//
//  Created by sebastian santivanez on 20/09/2026.
//

import SwiftUI
import SwiftData

@main
struct Shopping_ListApp: App {
    let container: ModelContainer
    
    init() {
        container = try! ModelContainer(for: Product.self)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ShoppingListViewModel(context: container.mainContext))
        }
        .modelContainer(container)
    }
}

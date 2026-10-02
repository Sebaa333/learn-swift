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
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Product.self)
    }
}

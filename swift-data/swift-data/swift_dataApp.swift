//
//  swift_dataApp.swift
//  swift-data
//
//  Created by sebastian santivanez on 28/09/2026.
//

import SwiftUI
import SwiftData
@main
struct swift_dataApp: App {
    
    // let container: ModelContainer = {
       // let schema = Schema([Expense.self])
     //   let container =  try!  ModelContainer(for: schema, configurations: [])
   //     return container
 //   }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
//        .modelContainer(container)
        .modelContainer(for: [Expense.self])
    }
}

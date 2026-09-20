//
//  ContentView.swift
//  Shopping-List
//
//  Created by sebastian santivanez on 20/09/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var products: [Product] = [
        Product(name: "Milk", price: 1500, category: "pantry"),
        Product(name: "Cookies", price: 2500, category: "pantry"),
        Product(name: "Chicken", price: 5500, category: "refrigerator"),
    ]
    
    private var pendingCount: Int {
        products.filter { !$0.isPurchased }.count
    }
    var body: some View {
        VStack{
            Text("Quedan \(pendingCount)")
            List{
                ForEach(products) { product in
                    HStack{
                        
                        VStack(alignment: .leading){
                            Text(product.name).strikethrough(product.isPurchased)
                            Text(product.category).font(.caption).foregroundStyle(.secondary)
                        }
                        Spacer()
                        Text(product.price , format: .currency(code: "USD"))
                    }
                    .onTapGesture {
                        if let index = products.firstIndex(where: { $0.id == product.id }) {
                            products[index].isPurchased.toggle()
                        }
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
// TODO (next session):
// 1. Add @State private var newProductName: String = ""
// 2. Add a TextField above the List, bound with $newProductName
// 3. Temporarily show newProductName in a Text to check the binding works
// 4. Only after that: add the "Add" button (append a Product to products, clear the field)
//
// Reminders:
// - Xcode placeholders (blue) must be replaced, they are not real values
// - products (array) vs product (single item inside ForEach)
// - If Ctrl+I doesn't re-indent, check for unbalanced braces

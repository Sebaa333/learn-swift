//
//  ContentView.swift
//  Shopping-List
//
//  Created by sebastian santivanez on 20/09/2026.
//

import SwiftUI

struct NewProductDraft {
    var name: String = ""
    var priceText: String = ""
    var category: String = ""
}

struct ContentView: View {
    @State private var isShowingAddSheet = false
    @State private var draft = NewProductDraft()
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
            Button("add") {
                isShowingAddSheet = true
            }
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
        .sheet(isPresented: $isShowingAddSheet) {
            AddProductView(onAdd: { newProduct in
                products.append(newProduct)
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
// TODO (next session):
// Current state: Add Product modal works end-to-end (Form + Section,
// NavigationStack, toolbar with Save/Cancel, keyboardType .decimalPad on price).
//
// 1. Add .disabled(draft.name.isEmpty) to the Save button
//    (small UX win: can't save with an empty name)
// 2. Handle the "invalid price" case for the user (right now it silently
//    does nothing if Double(draft.priceText) fails — maybe show a message
//    or highlight the field instead of just ignoring the tap)
// 3. Optional styling pass: check how a native app (Reminders, Settings)
//    handles a similar form before inventing custom colors/shapes
// 4. Bigger feature to consider: delete a product (swipe to delete on
//    the List, using .onDelete)
//
// Reminders:
// - $ is ONLY for binding to interactive controls (TextField, Toggle).
//   Reading a value to build something (like Product(...)) never uses $.
// - products (array, plural) vs product (single item inside ForEach)
// - NewProductDraft groups form state; Product is the domain model —
//   keep that split when adding new fields

//
//  AddProductView.swift
//  Shopping-List
//
//  Created by sebastian santivanez on 21/09/2026.
//
import SwiftUI

struct AddProductView: View {
    @State private var draft = NewProductDraft()
    @Environment(\.dismiss) private var dismiss
    
    var onAdd: (Product) -> Void
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Product Info") {   // un título de sección, ej. "Product Info"
                    TextField("Add Product", text: $draft.name)
                    TextField("Add price ", text: $draft.priceText)
                        .keyboardType(.decimalPad)   // teclado numérico, ya que es un precio
                    TextField("Add Category", text: $draft.category)
                }
            }
            .navigationTitle("New Product")   // título arriba, ej. "New Product"
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        if let price = Double(draft.priceText) {
                            onAdd(Product(name: draft.name, price: price, category: draft.category))
                            dismiss()
                        }
                    }.disabled(draft.name.isEmpty)
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
            }
        }
    }
}

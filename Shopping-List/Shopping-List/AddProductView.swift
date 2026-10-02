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
    
    var productToEdit: Product? = nil
    var onAdd: (Product) -> Void = { _ in }
    
    private var isEditing: Bool { productToEdit != nil }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Product Info") {
                    TextField("Add Product", text: $draft.name)
                    TextField("Add price", text: $draft.priceText)
                        .keyboardType(.decimalPad)
                    TextField("Add Category", text: $draft.category)
                }
            }
            .navigationTitle(isEditing ? "Edit Product" : "New Product")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        if let price = Double(draft.priceText) {
                            if let product = productToEdit {
                                product.name = draft.name
                                product.price = price
                                product.category = draft.category
                            } else {
                                onAdd(Product(name: draft.name, price: price, category: draft.category))
                            }
                            dismiss()
                        }
                    }
                    .disabled(draft.name.isEmpty)
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
            }
            .onAppear {
                if let product = productToEdit {
                    draft.name = product.name
                    draft.priceText = String(product.price)
                    draft.category = product.category
                }
            }
        }
    }
}

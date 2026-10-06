//
//  AddProductView.swift
//  Shopping-List
//
//  Created by sebastian santivanez on 21/09/2026.
//
import SwiftUI
struct AddProductView: View {
    @State private var form: ProductFormViewModel
    @Environment(\.dismiss) private var dismiss
    
    var onAdd: (Product) -> Void
    
    init(productToEdit: Product? = nil, onAdd: @escaping (Product) -> Void = { _ in }) {
        _form = State(initialValue: ProductFormViewModel(productToEdit: productToEdit))
        self.onAdd = onAdd
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Product Info") {
                    TextField("Add Product", text: $form.name)
                    TextField("Add price", text: $form.priceText)
                        .keyboardType(.decimalPad)
                    if let error = form.priceError {
                        Text(error)
                            .font(.caption)
                            .foregroundStyle(.red)
                    }
                    TextField("Add Category", text: $form.category)
                }
            }
            .navigationTitle(form.isEditing ? "Edit Product" : "New Product")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        form.save(onCreate: onAdd)
                        dismiss()
                    }
                    .disabled(!form.isValid)
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
            }
        }
    }
}

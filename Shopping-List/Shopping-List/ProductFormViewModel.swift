//
//  ProductFormViewModel.swift
//  Shopping-List
//
//  Created by sebastian santivanez on 05/10/2026.
//

import Foundation
import Observation

@MainActor
@Observable
final class ProductFormViewModel {
    var name = ""
    var priceText = ""
    var category = ""
    
    private let productToEdit: Product?
    
    init(productToEdit: Product? = nil) {
        self.productToEdit = productToEdit
        if let product = productToEdit {
            name = product.name
            priceText = Self.format(product.price)
            category = product.category
        }
    }
    
    var isEditing: Bool { productToEdit != nil }
    
    private var trimmedName: String {
        name.trimmingCharacters(in: .whitespaces)
    }
    
    private var parsedPrice: Double? {
        let normalized = priceText
            .trimmingCharacters(in: .whitespaces)
            .replacingOccurrences(of: ",", with: ".")
        return Double(normalized)
    }
    
    var priceError: String? {
        guard !priceText.isEmpty else { return nil }
        guard let price = parsedPrice else { return "Ingresá un precio válido" }
        guard price >= 0 else { return "El precio no puede ser negativo" }
        return nil
    }
    
    var isValid: Bool {
        guard !trimmedName.isEmpty, let price = parsedPrice else { return false }
        return price >= 0
    }
    
    func save(onCreate: (Product) -> Void) {
        guard isValid, let price = parsedPrice else { return }
        let trimmedCategory = category.trimmingCharacters(in: .whitespaces)
        
        if let product = productToEdit {
            product.name = trimmedName
            product.price = price
            product.category = trimmedCategory
        } else {
            onCreate(Product(name: trimmedName, price: price, category: trimmedCategory))
        }
    }
    
    private static func format(_ price: Double) -> String {
        price.formatted(.number.grouping(.never).precision(.fractionLength(0...2)))
    }
}

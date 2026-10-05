//
//  ShoppingListViewModel.swift
//  Shopping-List
//
//  Created by sebastian santivanez on 04/10/2026.
//
import SwiftData
import Observation
import Foundation

@MainActor
@Observable
final class ShoppingListViewModel {
    private let context: ModelContext
    private(set) var products: [Product] = []
    
    init(context: ModelContext) {
        self.context = context
        fetchProducts()
    }
    
    var pendingCount: Int {
        products.filter { !$0.isPurchased }.count
    }
    
    var shouldShowEmptyState: Bool {
        products.isEmpty
    }
    
    func fetchProducts() {
        let descriptor = FetchDescriptor<Product>(sortBy: [SortDescriptor(\.name)])
        products = (try? context.fetch(descriptor)) ?? []
    }
    
    func add(_ product: Product) {
        context.insert(product)
        fetchProducts()
    }
    
    func toggle(_ product: Product) {
        product.isPurchased.toggle()
    }
    
    func delete(_ product: Product) {
        context.delete(product)
        fetchProducts()
    }
}

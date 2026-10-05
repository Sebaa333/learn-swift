//
//  ContentView.swift
//  Shopping-List
//
//  Created by sebastian santivanez on 20/09/2026.
//

import SwiftUI
import SwiftData

struct NewProductDraft {
    var name: String = ""
    var priceText: String = ""
    var category: String = ""
}

struct ContentView: View {
    @State private var viewModel: ShoppingListViewModel
    @State private var isShowingAddSheet = false
    @State private var productToEdit: Product?
    
    init(viewModel: ShoppingListViewModel) {
        _viewModel = State(initialValue: viewModel)
    }
    
    var body: some View {
        NavigationStack{
            List{
                
                Section("Quedan \(viewModel.pendingCount)"){
                    ForEach(viewModel.products) { product in
                        HStack {
                            Button {
                                withAnimation {
                                    viewModel.toggle(product)
                                }
                            } label: {
                                Image(systemName: product.isPurchased ? "checkmark.circle.fill" : "circle")
                                    .font(.title3)
                                    .foregroundStyle(product.isPurchased ? .green : .secondary)
                            }
                            .buttonStyle(.plain)
                            
                            VStack(alignment: .leading) {
                                Text(product.name)
                                    .strikethrough(product.isPurchased)
                                    .foregroundStyle(product.isPurchased ? .secondary : .primary)
                                Text(product.category)
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                            Text(product.price, format: .currency(code: "ARS"))
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            productToEdit = product
                        }
                        .swipeActions {
                            Button(role: .destructive) {
                                viewModel.delete(product)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Shopping List")
                        .font(.title.bold())
                }
                ToolbarItem(placement: .primaryAction) {
                    Button("Add", systemImage: "plus") {
                        isShowingAddSheet = true
                    }
                }
            }
            .overlay {
                if viewModel.shouldShowEmptyState {
                    ContentUnavailableView(
                        "Tu lista está vacía",
                        systemImage: "cart",
                        description: Text("Tocá + para agregar tu primer producto")
                    )
                }
            }
        }
        .sheet(isPresented: $isShowingAddSheet) {
            AddProductView(onAdd: { newProduct in
                viewModel.add(newProduct)
            })
        }
        .sheet(item: $productToEdit, onDismiss: { viewModel.fetchProducts() }) { product in
            AddProductView(productToEdit: product)
        }
        
    }
}

#Preview {
    let container = try! ModelContainer(
        for: Product.self,
        configurations: ModelConfiguration(isStoredInMemoryOnly: true)
    )
    return ContentView(viewModel: ShoppingListViewModel(context: container.mainContext))
        .modelContainer(container)
}

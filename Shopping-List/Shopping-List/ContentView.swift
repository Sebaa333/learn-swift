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
    @State private var isShowingAddSheet = false
    @State private var productToEdit: Product?
    @Environment(\.modelContext) private var context
    @Query(sort: \Product.name) private var products: [Product]
    
    private var pendingCount: Int {
        products.filter { !$0.isPurchased }.count
    }
    var body: some View {
        NavigationStack{
            List{
                
                Section("Quedan \(pendingCount)"){
                    ForEach(products) { product in
                        HStack {
                            Button {
                                withAnimation {
                                    product.isPurchased.toggle()
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
                                context.delete(product)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            withAnimation {
                                product.isPurchased.toggle()
                            }
                        }
                        .onTapGesture {
                            product.isPurchased.toggle()
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
                if products.isEmpty {
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
                context.insert(newProduct)
            })
        }
        .sheet(item: $productToEdit) { product in
            AddProductView(productToEdit: product)
        }
        
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Product.self, inMemory: true)
}

//Shopping-List: estado al 2/10
//
//Hecho:
//
//Persistencia con SwiftData: @Model, .modelContainer en la App, @Query y context.insert en ContentView.
//UI: título custom con + en la toolbar, Section con contador de pendientes, empty state con ContentUnavailableView y precios en ARS.
//Círculo de check como botón propio para marcar como comprado.
//Swipe to delete con .swipeActions.
//Editar: tocar la fila abre AddProductView con los datos cargados, usando .sheet(item:) y un draft.
//
//Para verificar al arrancar:
//
//Probar en el simulador: agregar, editar, Cancel (que no cambie nada), borrar, y cerrar y reabrir la app para confirmar que persiste.
//Opcional: renombrar AddProductView a ProductFormView (Refactor → Rename).
//
//Pendientes conocidos (para el punto 5, validación):
//
//Precio con coma (1500,50): Double() devuelve nil y Save no hace nada sin avisar.
//Al editar, el precio aparece como 1500.0.
//
//Próximo paso: MVVM
//
//Crear ShoppingListViewModel y sacar la lógica de la View: pendingCount, el empty state, agregar, togglear y borrar.
//Pregunta guía: "¿esto es dato, lógica o presentación?"
//
//Después: categorías y múltiples listas → validaciones → #Preview prolijos → README con capturas.

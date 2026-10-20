//
//  MealListView.swift
//  Recipe-collection
//
//  Created by sebastian santivanez on 19/10/2026.
//

import SwiftUI

struct MealListView: View {
    @State private var viewModel = MealListViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.meals) { meal in
                HStack {
                    AsyncImage(url: meal.thumbnail) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    Text(meal.name)
                }
            }
            .navigationTitle("Recipes")
            .task {
                await viewModel.loadMeals()
            }
        }
    }
}

#Preview {
    MealListView()
}

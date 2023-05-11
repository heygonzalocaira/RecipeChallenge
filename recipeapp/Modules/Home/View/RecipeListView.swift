//
//  RecipeListView.swift
//  recipeapp
//
//  Created by heygonza on 8/05/23.
//

import SwiftUI

struct RecipeListView: View {
    let recipes : [Recipe]
    
    @State private var searchText: String = ""
    
    var filteredRecipes: [Recipe] {
        if searchText.count == 0 {
            return recipes
        } else {
            return recipes.filter { $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    
    var body: some View {
        NavigationView{
            List{
                ForEach(filteredRecipes) { recipe in
                    
                    NavigationLink {
                        RecipeDetailView(recipe: recipe)
                    } label: {
                        RecipeCard(recipe: recipe)
                    }
                }
            }.listStyle(PlainListStyle()).navigationTitle("Recipes").searchable(text: $searchText)
        }.onAppear {
            let memoryCapacity = 1024 * 1024 // Memory size in bytes (1MB in this case)
            let diskCapacity = 0 // Size of disk storage in bytes (0 to disable disk storage)            
            let sharedCache = URLCache(memoryCapacity: memoryCapacity, diskCapacity: diskCapacity, diskPath: nil)
            URLCache.shared = sharedCache
        }
        
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView(recipes: HomeViewModel.successState().recipes)
    }
}

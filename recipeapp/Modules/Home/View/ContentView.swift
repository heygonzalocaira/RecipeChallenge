//
//  ContentView.swift
//  recipeapp
//
//  Created by heygonza on 7/05/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var recipeFetcher = HomeViewModel()
    var body: some View {
        if recipeFetcher.isLoading{
            LoadingView()
        } else if recipeFetcher.errorMessage != nil {
            ErrorView(homeFetcher:  recipeFetcher)
        } else{
            RecipeListView(recipes: recipeFetcher.recipes)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

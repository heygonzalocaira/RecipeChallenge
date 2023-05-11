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
            Text("Cargando")
        } else if recipeFetcher.errorMessage != nil {
            Text("Error")
        } else{
            Text("se pudo")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

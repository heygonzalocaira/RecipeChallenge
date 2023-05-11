//
//  ErrorView.swift
//  recipeapp
//
//  Created by heygonza on 9/05/23.
//

import SwiftUI

struct ErrorView: View {
    @ObservedObject var homeFetcher: HomeViewModel
    var body: some View {
        VStack {
            
            Text("🙁")
                .font(.system(size: 80))
            
            Text(homeFetcher.errorMessage ?? "")
            
            Button {
                homeFetcher.fetchAllRecipes()
            } label: {
                Text("Try again")
            }

            
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(homeFetcher: HomeViewModel())
    }
}

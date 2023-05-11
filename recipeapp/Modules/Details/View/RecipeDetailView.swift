//
//  RecipeDetailView.swift
//  recipeapp
//
//  Created by heygonza on 10/05/23.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
        let imageSize: CGFloat = 300
        
        var body: some View {
            ScrollView {
                VStack {
                    if recipe.imageUrl != nil {
                        AsyncImage(url: URL(string: recipe.imageUrl!)) { phase in
                            if let image = phase.image {
                                image.resizable()
                                    .scaledToFit()
                                    .frame( height: imageSize)
                                    .clipped()
                                
                            } else if phase.error != nil {
                                
                                Text(phase.error?.localizedDescription ?? "error")
                                    .foregroundColor(Color.pink)
                                    .frame(width: imageSize, height: imageSize)
                            } else {
                                ProgressView()
                                    .frame(width: imageSize, height: imageSize)
                            }
                            
                        }
                    }else {
                        Color.gray.frame(height: imageSize)
                    }
                    
                    VStack(alignment: .leading, spacing: 15) {
                        
                        Text(recipe.name)
                            .font(.headline)
                        Text(recipe.description)
                            .font(.footnote)
                    
                 
                        
                        HStack {
                            Text("RAting")
                            Spacer()
                            ForEach(1..<6) { id in
                                Image(systemName: "star.fill")
                                    
                            }
                        }
                        
                        Spacer()
                    }.padding()
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: Recipe.example1())
    }
}

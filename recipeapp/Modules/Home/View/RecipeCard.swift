//
//  RecipeCard.swift
//  recipeapp
//
//  Created by heygonza on 10/05/23.
//

import SwiftUI

struct RecipeCard: View {
    let recipe: Recipe
    let imageSize: CGFloat = 100
    var body: some View {
        HStack {
            
            if recipe.imageUrl != nil {
                
                AsyncImage(url: URL(string: recipe.imageUrl!)) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFill()
                            .frame(width: imageSize, height: imageSize)
                            .clipped()
                        
                     } else if phase.error != nil {
                         
                         Text("📎")
                             .font(.system(size: 80))
                             .foregroundColor(Color.gray)
                             .frame(width: imageSize, height: imageSize)
                              
                     } else {
                        ProgressView()
                             .frame(width: imageSize, height: imageSize)
                     }
                    
                }
            }else {
                Color.gray.frame(width: imageSize, height: imageSize)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(recipe.name)
                    .font(.headline)
                HStack {
                    Text("Rating")
                    
                    ForEach(1..<recipe.rating, id: \.self) { id in
                        Image(systemName: "star.fill")
                            
                    }
                }
            }
        }
     
    }
}

struct RecipeCard_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCard(recipe: Recipe.example1()) .previewLayout(.fixed(width: 400, height: 200))
    }
}

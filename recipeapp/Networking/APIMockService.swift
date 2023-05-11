//
//  APIMockService.swift
//  recipeapp
//
//  Created by heygonza on 11/05/23.
//

import Foundation
struct APIMockService: APIServiceProtocol {
    
    
    var result: Result<[Recipe], APIError>
    
    func fetchRecipes(url: URL?, completion: @escaping (Result<[Recipe], APIError>) -> Void) {
        completion(result)
    }
    
    
}

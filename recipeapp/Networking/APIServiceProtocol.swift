//
//  APIServiceProtocol.swift
//  recipeapp
//
//  Created by heygonza on 8/05/23.
//

import Foundation


protocol APIServiceProtocol {
    func fetchRecipes(url: URL?, completion: @escaping(Result<[Recipe], APIError>) -> Void)
}

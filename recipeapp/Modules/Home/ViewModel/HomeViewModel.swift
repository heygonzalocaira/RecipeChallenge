//
//  HomeViewModel.swift
//  recipeapp
//
//  Created by heygonza on 8/05/23.
//

import Foundation

class HomeViewModel: ObservableObject{
    
    @Published var recipes = [Recipe]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    let service :APIServiceProtocol
    
    init(service: APIServiceProtocol = APIService()){
        self.service = service
        fetchAllRecipes()
    }
    

   
    func fetchAllRecipes(){
        isLoading = true
        errorMessage = nil
        
        let url = URL(string: Constants.mainUrl)
        
        service.fetchRecipes(url: url){
            [unowned self] result in
            
            DispatchQueue.main.async {
                self.isLoading = false
                switch result{
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    print(error)
                case .success(let recipes):
                    self.recipes = recipes
                  
                }
            }
        }
    }
    
    
    //MARK: preview helpers
    
    static func errorState() -> HomeViewModel {
        let fetcher = HomeViewModel()
        fetcher.errorMessage = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }
    
    static func successState() -> HomeViewModel {
        let fetcher = HomeViewModel()
        fetcher.recipes = [Recipe.example1(), Recipe.example1()]
        
        return fetcher
    }
}

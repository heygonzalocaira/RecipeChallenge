//
//  recipeappTests.swift
//  recipeappTests
//
//  Created by heygonza on 7/05/23.
//

import XCTest
import Combine
@testable import recipeapp

final class recipeappTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    override func tearDown() {
            subscriptions = []
        }
        
        var subscriptions = Set<AnyCancellable>()
        
        func test_getting_breeds_success() {
            let result = Result<[Recipe], APIError>.success([Recipe.example1()])
            
            let fetcher = HomeViewModel(service: APIMockService(result: result))
            
            let promise = expectation(description: "getting breeds")
            
            fetcher.$recipes.sink { breeds in
                if breeds.count > 0 {
                    promise.fulfill()
                }
            }.store(in: &subscriptions)
            
           
            wait(for: [promise], timeout: 2)
        }
        
        
        func test_loading_error() {
           
             let result = Result<[Recipe], APIError>.failure(APIError.badURL)
             let fetcher = HomeViewModel(service: APIMockService(result: result))
             
            let promise = expectation(description: "show error message")
            fetcher.$recipes.sink { breeds in
                if !breeds.isEmpty {
                    XCTFail()
                }
            }.store(in: &subscriptions)
            
            
            fetcher.$errorMessage.sink { message in
                if message != nil {
                    promise.fulfill()
                }
            }.store(in: &subscriptions)
            
            wait(for: [promise], timeout: 2)
            
        }
}

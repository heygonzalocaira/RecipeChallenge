//
//  LocationModel.swift
//  recipeapp
//
//  Created by heygonza on 8/05/23.
//

import Foundation


struct Location: Codable{
    
    let latitude: Double
    let longitude: Double
    

    
    init(latitude:Double, longitude:Double){
        self.latitude = latitude
        self.longitude = longitude
    }
    static func example1()-> Location{
        return Location(latitude: -74.213, longitude: 45.555)
    }
}



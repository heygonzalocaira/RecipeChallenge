//
//  RecipeModel.swift
//  recipeapp
//
//  Created by heygonza on 8/05/23.
//



/*
{
   "id": 1,
   "name": "Spaghetti Bolognese",
   "description": "Classic Italian pasta dish with rich tomato sauce and ground beef.",
   "imageurl": "https://example.com/spaghetti_bolognese.jpg",
   "rating": 4,
   "location": {
     "latitude": 40.7128,
     "longitude": -74.0060
   }
 },
*/

import Foundation

struct Recipe:Codable , CustomStringConvertible,Identifiable{
    
    let id:String
    let name: String
    let description : String
    let imageUrl : String?
    let rating : Int
    let location: Location
    
    var information: String {
        return "Recipe with name: \(name) and id \(id), image: \(imageUrl ?? "Empty")"
    }
    
    enum CodingKeys : String, CodingKey{
        case id
        case name
        case description
        case imageUrl = "image_url"
        case rating
        case location
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        description = try values.decode(String.self, forKey: .description)
        imageUrl = try values.decodeIfPresent(String.self, forKey: .imageUrl)
        rating = try values.decode(Int.self, forKey: .rating)
        location = try values.decode(Location.self, forKey: .location)
    }
    
    init(id:String, name: String, description:String, imageUrl: String?,rating:Int,location:Location){
        self.id = id
        self.name = name
        self.description = description
        self.imageUrl = imageUrl
        self.rating = rating
        self.location = location
    }
    
    static func example1()-> Recipe{
        return Recipe(id: "1",name: "Spaghetti Bolognese",description: "Classic Italian pasta dish with rich tomato sauce and ground beef.",
                      imageUrl: "https://picsum.photos/250?image=9",rating: 3,location: Location(latitude: -74.213, longitude: 45.555))
    }
}

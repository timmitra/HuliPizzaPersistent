//
//  RatingModel.swift
//  minipizzaApp
//
//  Created by Steven Lipton on 10/17/23.
//

import Foundation
import SwiftData

@Model
class RatingModel:Identifiable{
    var pizzaName:String
    var rating:Int
    init(pizzaName:String = "", rating: Int = 0) {
        self.pizzaName = pizzaName
        self.rating = rating
    }
    
}

//
//  Enumerations.swift
//  minipizzaApp
//
//  Created by Steven Lipton on 10/13/23.
//
//  Conatins all models for the app

import Foundation

///Ratings icon constants
enum RatingsIcon:String, CaseIterable{
    case star = "star"
    case plate = "fork.knife.circle"
    case heart = "heart"
    case circle = "circle"
}

/// The size of a pizza, and text values to match
enum PizzaSize:Int,CaseIterable{
    case small = 0
    case medium = 1
    case large = 2
    case xlarge = 3
    
    ///Text values for a size of a pizza
    var textValue:String{
        let textValues = ["Small","Medium","Large","ExtraLarge"]
        return textValues[self.rawValue]
    }
}

/// The categories of pizzas used
enum MenuCategory: String, CaseIterable {
    case originals = "Huli Pizza Originals"
    case italian = "Italian Specialty Pizzas"
    case mainland = "Mainland Specialty Pizzas"
}












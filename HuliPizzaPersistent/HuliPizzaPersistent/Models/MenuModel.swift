//
//  MenuModel.swift
//  minipizzaApp
//
//  Created by Steven Lipton on 10/17/23.
//

import Foundation

/// Our menu for the restaurant. For conciseness we use arrays and `MenuItem`` to create data.
struct MenuModel{
    /// A hard coded menu made of `MenuItem`s
    let menu:[MenuItem] = [
        MenuItem(key: 0, name: "Margherita", basicPrice: 13.00,category: .italian, rating: 6),
        MenuItem(key: 1, name: "Quattro Formaggi", basicPrice: 15.00, category: .italian, rating: 5),
        MenuItem(key: 2, name: "The Big Island", basicPrice: 15.00, category: .mainland, rating: 4),
        MenuItem(key: 3, name: "Longboard", basicPrice: 11, category: .mainland, rating: 4),
        MenuItem(key: 4, name: "Pepperoni", basicPrice: 12, category: .mainland, rating: 5),
        MenuItem(key: 5, name: "Chicago Deep Dish", basicPrice: 16, category: .mainland, rating: 3),
        MenuItem(key: 6, name: "Meat Lovers", basicPrice: 18, category: .mainland, rating: 4),
        MenuItem(key: 7, name: "BBQ Chicken", basicPrice: 15, category: .mainland, rating: 4),
        MenuItem(key: 8, name: "Huli Chicken", basicPrice: 15, category: .originals, rating: 6),
        MenuItem(key: 9, name: "Hawaiian", basicPrice: 13, category: .originals, rating: 5),
        MenuItem(key: 10, name: "Spam Musubi", basicPrice: 13, category: .originals, rating: 3),
        MenuItem(key: 11, name: "Veggie Musubi", basicPrice: 14, category: .originals, rating: 3),
    ]
}

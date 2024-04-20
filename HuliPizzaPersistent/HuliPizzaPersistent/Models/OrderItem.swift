//
//  OrderItem.swift
//  minipizzaApp
//
//  Created by Steven Lipton on 10/17/23.
//

import Foundation
import SwiftData

@Model
class OrderItem:Identifiable{
    var ticketKey:Int
    var rowKey:Int
    var menuItem:MenuItem
    var size:PizzaSize
    var quantity:Double
    
    
    //Computed Properties and functions
    //The compute prices and extended prices
    
    ///Price calculated based on basic price and size properties .
    var price:Double{
        menuItem.basicPrice * (Double(size.rawValue) * 0.5 + 1)
    }
    
    
    func price(basicPrice:Double,size:PizzaSize)->Double{
        basicPrice * (Double(size.rawValue) * 0.5 + 1)
    }
    
    var extendedPrice:Double{
        price * quantity
    }
    
    func extendedPrice(basicPrice:Double,size:PizzaSize, quantity:Double)->Double{
        price(basicPrice: basicPrice, size: size) * quantity
    }
    
    init(ticketKey: Int = -1, rowKey: Int = 0, menuItem: MenuItem = MenuItem(), size: PizzaSize = .small, quantity: Double = 1) {
        self.ticketKey = ticketKey
        self.rowKey = rowKey
        self.menuItem = menuItem
        self.size = size
        self.quantity = quantity
    }
}

//
//  OrderTicket.swift
//  minipizzaApp
//
//  Created by Steven Lipton on 10/17/23.
//

import Foundation

@Observable
class OrderTicket:Identifiable{
    
    //Model properties
    var ticketKey:Int
    var items:[OrderItem]
    var name: String
    
    //Computed Properties
    var totalPrice:Double{
        items.map{$0.extendedPrice}.reduce(0,+)
    }
    var totalPizzas:Int{
       Int(items.map{$0.quantity}.reduce(0,+))
    }
    
    //Initializer with defaults to make a blank version as necessary
    init(ticketKey: Int = -1, items: [OrderItem] = [], name: String = "") {
        self.ticketKey = ticketKey
        self.items = items
        self.name = name
    }
    
    
    
}

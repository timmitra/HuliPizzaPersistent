//
//  HPSchemaV01_01_00.swift
//  HuliPizzaPersistent
//
//  Created by Tim Mitra on 2024-04-20.
//

import Foundation
import SwiftData

enum HPSchemaV01_01_00:VersionedSchema {
  
  static var models: [any PersistentModel.Type] {
    return [OrderTicket.self, OrderItem.self, NameModel.self, RatingModel.self]
  }
  
  static var versionIdentifier: Schema.Version = Schema.Version(1,1,0)
  
  @Model
  class OrderTicket:Identifiable{
    
    //Model properties
    var ticketKey:Int
    @Relationship(deleteRule: .cascade) var items:[OrderItem]
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
  
  @Model
  class OrderItem:Identifiable{
    var ticketKey:Int
    var rowKey:Int
    var menuItemKey: Int = 0
    var menuItem:MenuItem {
      get { MenuModel().menu.first(where:{ $0.key == menuItemKey })!}
      // Model has a key internal ID
      set { menuItemKey = newValue.key } // all setters have newValue
    }
    var size:PizzaSize
    var quantity:Double
    @Transient var dateStamp: Date = Date()
    
    
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
      self.size = size
      self.quantity = quantity
      // other properties would need to have default value, so move to end.
      self.menuItem = menuItem
    }
  }
  
  @Model
  class NameModel{
    @Attribute(.unique) var name:String
    var partySize:Int
    init(name: String, partySize: Int) {
      self.name = name
      self.partySize = partySize
    }
  }
  
  @Model
  class RatingModel:Identifiable{
    @Attribute(originalName: "pizzaName") var menuItemName:String
    var rating:Int
    var ratingIcon: RatingsIcon
    init(pizzaName:String = "", rating: Int = 0, ratingIcon:RatingsIcon = .star) {
      self.menuItemName = pizzaName
      self.rating = rating
      self.ratingIcon = ratingIcon
    }
    
  }
  
}

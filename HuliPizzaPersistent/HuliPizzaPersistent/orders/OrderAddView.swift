//
//  OrderAddView.swift
//  minipizzaApp
//
//  Created by Steven Lipton on 10/16/23.
//

import SwiftUI
import SwiftData

struct OrderAddView: View {
  @Environment(\.modelContext) private var modelContext
  //@Binding var orders:[OrderItem]
  @Query var orders:[OrderItem]
    @Binding var size:PizzaSize
    @Binding var quantity:Double
    var ticketKey:Int
    var maxRowKey:Int
    @Binding var isPresented:Bool
    @Binding var tabTag:Int
    @State private var menuItem:MenuItem = MenuItem()
    
    var body: some View {
        VStack{
            OrderEntryView(menuItem: menuItem, size: $size, quantity: $quantity)
            MenuListView(tabTag: .constant(tabTag), selectedItem: $menuItem)
            HStack{
                Button("Save"){
                    if menuItem.key >= 0 {
                        let newQuantity = quantity
                        let newMenuItem = menuItem
                        let newSize = size
                        let newRowKey = maxRowKey + 1
                        let newOrderItem = OrderItem(ticketKey: ticketKey, rowKey: newRowKey, menuItem: newMenuItem, size: newSize, quantity: newQuantity)
                        //orders.append(newOrderItem)
                      modelContext.insert(newOrderItem)
                        quantity = 1
                        size = .small
                        isPresented = false
                    }
                }
                .font(.title2)
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .padding([.top,.bottom])
                .frame(maxWidth:.greatestFiniteMagnitude)
                .background(.surf, in: RoundedRectangle(cornerRadius: 15))
                .padding([.leading,.trailing,.top])
            }
        }
    }
}

//#Preview {
//    OrderAddView(orders:.constant([]),size: .constant(.small), quantity: .constant(1), ticketKey: 0, maxRowKey: 0, isPresented: .constant(true), tabTag: .constant(0))
//}

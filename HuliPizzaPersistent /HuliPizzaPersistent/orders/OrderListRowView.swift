//
//  OrderListRowView.swift
//  minipizzaApp
//
//  Created by Steven Lipton on 10/15/23.
//

import SwiftUI

struct OrderListRowView: View {
    var orderItem:OrderItem
    var body: some View {
        HStack(alignment:.center){
            
            Text(orderItem.rowKey,format:.number)
            Image(uiImage: orderItem.menuItem.uiImage)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .padding(.trailing)
            VStack{
                HStack{
                    Text(orderItem.menuItem.name)
                        
                    Spacer()
                    Text(orderItem.extendedPrice,format: .currency(code: "USD"))
                            
                }
                .font(.title).bold()
                HStack{
                Text(orderItem.size.textValue)
                        
                Text("Pizza")
                Spacer()
                Text(orderItem.price,format: .currency(code: "USD"))
                    Text("x")
                    Text(orderItem.quantity,format: .number)
                    Text(orderItem.quantity == 1 ? "pizza" : "pizzas")

                
                }
                .font(.headline)
                HStack{
                    Spacer()
                    Text(orderItem.ticketKey,format:.number)
                   
                   
                }.font(.caption)
            }
        }
    }
}

#Preview {
    OrderListRowView(orderItem: OrderItem(ticketKey: 1, rowKey: 0, menuItem: MenuModel().menu[0], size: .small, quantity: 1))
}

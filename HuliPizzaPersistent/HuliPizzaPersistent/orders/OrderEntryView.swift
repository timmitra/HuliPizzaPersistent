//
//  NewMenuItem.swift
//  minipizzaApp
//
//  Created by Steven Lipton on 10/13/23.
//

import SwiftUI

struct OrderEntryView: View {
    var menuItem:MenuItem
    @Binding var size:PizzaSize
    @Binding var quantity:Double
    
    
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Spacer()
                    Text(quantity,format: .number)
                    Text(size.textValue)
                    Text((quantity == 1 ) ? "Pizza" : "Pizzas")
                    Text(OrderItem().extendedPrice(basicPrice: menuItem.basicPrice, size: size,quantity: quantity),format: .currency(code: "USD"))
                        .fontWeight(.heavy)
                }.font(.title)
                MenuItemRowView(menuItem: menuItem)
                HStack(alignment:.center) {
                    Text("Pizza Quantity:")
                        .padding([.trailing])
                    Stepper("\(quantity,format: .number)",value: $quantity)
                }
                .font(.title3).fontWeight(.heavy)
                HStack(alignment:.firstTextBaseline) {
                    Text("Pizza Size")
                        .font(.title3).fontWeight(.heavy)
                        .padding([.top,.trailing],20)
                    Picker("Size", selection: $size) {
                        ForEach(PizzaSize.allCases,id:\.self){ size in
                            Text(size.textValue).tag(size)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    
                }
            }
        }
    }
}

#Preview {
    OrderEntryView(menuItem: testitem, size: .constant(.small), quantity: .constant(1))
    .modelContainer(autoSaveModelContainer)
}

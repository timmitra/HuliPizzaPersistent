//
//  OrderEditView.swift
//  minipizzaApp
//
//  Created by Steven Lipton on 10/16/23.
//

import SwiftUI

struct OrderEditView: View {
    var menuItem:MenuItem
    @Binding var size:PizzaSize
    @Binding var quantity:Double
    @Binding var isPresented:Bool
    var body: some View {
        VStack{
            OrderEntryView(menuItem: menuItem, size: $size, quantity: $quantity)
            HStack{
                Button("Save"){
                    isPresented = false
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

#Preview {
    OrderEditView(menuItem: testitem, size: .constant(.small), quantity: .constant(1), isPresented: .constant(true))
}

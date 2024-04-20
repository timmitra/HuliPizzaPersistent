//
//  OrderListView.swift
//  minipizzaApp
//
//  Created by Steven Lipton on 10/13/23.
//

import SwiftUI
import SwiftData


struct OrderListView: View {
  @Environment(\.modelContext) private var modelContext
    //model
    @Binding var ticketKey:Int
  @Binding var orderItems:[OrderItem]
 // @Query var orderItems:[OrderItem]
    @State private var currentOrder = OrderItem()
    
    
    //navigation
    @State private var isEditPresented = false
    @State private var isAddPresented = false
    
    private var keyList:[Int]{
        orderItems.map{$0.rowKey}.sorted()
    }
    
    private var maxKey:Int{
        keyList.max() ?? -1
    }
    
    var body: some View {
        VStack{
            if orderItems.isEmpty && !(ticketKey < 0) {
                ZStack{
                    SurferBackgroundView()
                    VStack{
                        Text("No Pizzas ordered")
                            .font(.title).fontWeight(.heavy)
                        Text("Tap the **Add Pizza** button below")
                    }
                }
            }
            List{
                ForEach(orderItems){item in
                    OrderListRowView(orderItem: item)
                        .onTapGesture{
                            isEditPresented = true
                            currentOrder = item
                        }
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet{
                        orderItems.remove(at: index)
                      //modelContext.delete(orderItems[index])
                    }
                })
            }
            Button("Add Pizza"){
                isAddPresented = true
            }
            .font(.title2)
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .padding([.top,.bottom])
                .frame(maxWidth:.greatestFiniteMagnitude)
                .background(.surf, in: RoundedRectangle(cornerRadius: 15))
                .padding([.leading,.trailing,.top])
                .opacity((isAddPresented || isEditPresented) ? 0 : 1)
        }
        .sheet(isPresented: $isEditPresented) {
            //dismissal code here
        } content: {
            VStack{
                OrderEditView(menuItem: currentOrder.menuItem, size: $currentOrder.size, quantity: $currentOrder.quantity, isPresented: $isEditPresented)
                Spacer()
            }.padding()
        }
        .sheet(isPresented: $isAddPresented) {
            //dismissal code here
        } content: {
          OrderAddView(orders: $orderItems, size: $currentOrder.size, quantity: $currentOrder.quantity,ticketKey: ticketKey, maxRowKey: maxKey, isPresented: $isAddPresented, tabTag: .constant(0))
          //OrderAddView(size: $currentOrder.size, quantity: $currentOrder.quantity,ticketKey: currentOrder.ticketKey, maxRowKey: maxKey, isPresented: $isAddPresented, tabTag: .constant(0))
                .padding()
        }
        
    }
}

let testitem = MenuModel().menu[2]
let testitem1 = MenuModel().menu[1]
let testTicket = OrderTicket(ticketKey: 1, items: [OrderItem(ticketKey: 1, rowKey: 1, menuItem: testitem1),OrderItem(ticketKey: 1, rowKey: 2, menuItem: testitem)])

//#Preview{
//    OrderListView(ticketKey: .constant(testTicket.ticketKey), orderItems: .constant(testTicket.items))
//}

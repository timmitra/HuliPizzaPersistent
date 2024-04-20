//
//  TicketView.swift
//  minipizzaApp
//
//  Created by Steven Lipton on 10/13/23.
//

import SwiftUI
import SwiftData

struct TicketView: View {
    @Environment(\.modelContext) private var modelContext
    @Binding var tabTag:Int

    
    //Model declarations
  //@State private var tickets:[OrderTicket] = []
  @Query private var tickets:[OrderTicket] = []
    @State private var currentTicket:OrderTicket = OrderTicket()
    
    @State private var ticketKey:Int = 1
    @State private var items:[OrderItem] = []
  @State private var deleteTicketSet:IndexSet = []
    @State private var isListViewVisible:Bool = false
   
    
    //Computed properties
    
    private var keyList:[Int]{
        tickets.map{$0.ticketKey}.sorted()
    }
    
    private var maxKey:Int{
        keyList.max() ?? -1
    }
    
    var body: some View {
        VStack{
            HStack{
                Text("\(tickets.count) Order Tickets")
                    .font(.title).fontWeight(.heavy)
                Button{
                    isListViewVisible.toggle()
                } label:{
                    Image(systemName: isListViewVisible ? "chevron.down" : "chevron.up")
                }
            }
          //TicketListView(ticketKey: $ticketKey, orderItems: $items, tickets: $tickets)
          TicketListView(ticketKey: $ticketKey, orderItems: $items, tickets: tickets, deleteTicketSet: $deleteTicketSet)
                .frame(height: isListViewVisible ? nil : 0)
                .onChange(of: deleteTicketSet) {
                  for index in deleteTicketSet {
                    modelContext.delete(tickets[index])
                  }
                }
            HStack{
                Button(keyList.contains(ticketKey) ? "Save Ticket": "Add Ticket"){
                    saveTicket()
                }
                .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding([.top,.bottom])
                    .padding([.leading,.trailing], 30)
                    .background(.surf, in: RoundedRectangle(cornerRadius: 15))
                    .padding([.leading,.trailing,.top])
                Spacer()
                if ticketKey >= 0{
                    Text("Order #")
                    Text(ticketKey,format: .number)
                } else {
                    Text("Press New ticket to begin")
                }
                Spacer()
                Text(currentTicket.totalPrice,format:.currency(code: "USD"))
            }
            .padding(20)
            .font(.title).bold()
            .background(.sky,in:Capsule())
            
          OrderListView(ticketKey: $ticketKey, orderItems: $items)
          //OrderListView(ticketKey: $ticketKey)

            Spacer()
        }
        
    }
    
    func saveTicket(){
            let newTicketKey = ticketKey
            let newItems = items
            let addedTicket = OrderTicket(ticketKey: newTicketKey, items: newItems)
        if !keyList.contains(where:{ $0 == ticketKey}){
            //tickets.append(addedTicket)
          modelContext.insert(addedTicket)
        } else {
            currentTicket.items = items
        }
            ticketKey = maxKey + 1
            items = []
            
    }
}

#Preview {
    TicketView(tabTag: .constant(0))
}

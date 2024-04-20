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
  @Query(sort: [SortDescriptor(\OrderTicket.ticketKey)]) private var tickets:[OrderTicket] = []
   // @State private var currentTicket:OrderTicket = OrderTicket()
    
    @State private var ticketKey:Int = 1
    @State private var items:[OrderItem] = []
  @State private var deleteTicketSet:IndexSet = []
    @State private var isListViewVisible:Bool = true
   
    
    //Computed properties
    
    private var keyList:[Int]{
        tickets.map{$0.ticketKey}.sorted()
    }
    
    private var maxKey:Int{
        keyList.max() ?? -1
    }
  
  private var nextKey: Int {
    maxKey + 1
  }
  
  private var ticketTotal: Double {
    items.map{ $0.extendedPrice}.reduce(0,+)
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
          HStack {
            //TicketListView(ticketKey: $ticketKey, orderItems: $items, tickets: $tickets)
            TicketListView(ticketKey: $ticketKey, orderItems: $items, tickets: tickets, deleteTicketSet: $deleteTicketSet)
              .frame(height: isListViewVisible ? nil : 0)
              .onChange(of: deleteTicketSet) {
                for index in deleteTicketSet {
                  modelContext.delete(tickets[index])
                  try! modelContext.save()
                }
              }
            AllOrdersView()
          }
            HStack{
              Button("Save") {
                try! modelContext.save()
              }
              .font(.title2)
                  .fontWeight(.heavy)
                  .foregroundColor(.white)
                  .padding([.top,.bottom])
                  .padding([.leading,.trailing], 30)
                  .background(.surf, in: RoundedRectangle(cornerRadius: 15))
                  .padding([.leading,.trailing,.top])
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
                Text(ticketTotal,format:.currency(code: "USD"))
            }
            .padding(20)
            .font(.title).bold()
            .background(.sky,in:Capsule())
            
          OrderListView(ticketKey: $ticketKey, orderItems: $items)
          //OrderListView(ticketKey: $ticketKey)

            Spacer()
        }
        .onAppear{
          ticketKey = nextKey
        }
        .onChange(of: tickets.count) {
          ticketKey = nextKey
        }
    }
    
    func saveTicket(){
            let newTicketKey = ticketKey
            let newItems = items
        if !keyList.contains(where:{ $0 == ticketKey}){
          let addedTicket = OrderTicket(ticketKey: newTicketKey, items: newItems)
            //tickets.append(addedTicket)
          modelContext.insert(addedTicket)
        } else {
        //    currentTicket.items = items
          let index = keyList.firstIndex{$0 == ticketKey}!
          tickets[index].items = newItems
        }
            ticketKey = nextKey
            items = []
            
    }
}

#Preview {
    TicketView(tabTag: .constant(0))
}

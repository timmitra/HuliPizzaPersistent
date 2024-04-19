//
//  TicketListView.swift
//  minipizzaApp
//
//  Created by Steven Lipton on 10/15/23.
//

import SwiftUI


struct TicketListView: View {
    @Binding var ticketKey:Int
    @Binding var orderItems:[OrderItem]
    @Binding var tickets:[OrderTicket]
    var body: some View {
        VStack{
            if tickets.isEmpty{
                ZStack{
                    SurferBackgroundView()
                    Text("No Tickets yet")
                        .font(.title).fontWeight(.heavy)
                }
            }
            List{
                ForEach(tickets){ticket in
                    HStack{
                        Text(ticket.ticketKey,format: .number)
                        Text(ticket.name)
                            .padding(.trailing,30)
                        Text("Number of pizzas:")
                        Text(ticket.totalPizzas,format:.number)
                        Spacer()
                        Text(ticket.totalPrice,format: .currency(code: "USD"))
                        
                    }
                    .onTapGesture {
                        ticketKey = ticket.ticketKey
                        orderItems = ticket.items
                    }
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet{
                        tickets.remove(at: index)
                    }
                })
            }
        }
    }
}

#Preview {
    TicketListView(ticketKey: .constant(1), orderItems: .constant(testTicket.items), tickets: .constant([testTicket]))
}

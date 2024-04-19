//
//  OrderTitleBar.swift
//  minipizzaApp
//
//  Created by Steven Lipton on 10/15/23.
//

import SwiftUI


struct TicketTitleBar: View {
    var currentTicket:OrderTicket
    @Binding var doAddTicket:Bool
    var body: some View {
        HStack{
            
            Button("New Ticket"){
                doAddTicket = true
            }
            .font(.title2)
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .padding([.top,.bottom])
                .padding([.leading,.trailing], 30)
                .background(.surf, in: RoundedRectangle(cornerRadius: 15))
                .padding([.leading,.trailing,.top])
            Spacer()
            if currentTicket.ticketKey >= 0{
                Text("Order #")
                Text(currentTicket.ticketKey,format: .number)
            } else {
                Text("Press New ticket to begin")
            }
            Spacer()
            Text(currentTicket.totalPrice,format:.currency(code: "USD"))
        }
        .padding(20)
        .font(.title).bold()
        .background(.sky,in:Capsule())
    }
}

#Preview {
    TicketTitleBar(currentTicket: OrderTicket(),doAddTicket: .constant(false))
}

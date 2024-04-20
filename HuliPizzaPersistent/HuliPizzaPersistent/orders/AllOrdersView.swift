//
//  AllOrdersView.swift
//  HuliPizzaPersistent
//
//  Created by Tim Mitra on 2024-04-20.
//

import SwiftUI
import SwiftData

struct AllOrdersView: View {
  @Environment(\.modelContext) private var modelContext
  @Query var orders:[OrderItem]
  
  var body: some View {
    Text(orders.map{$0.extendedPrice}.reduce(0, +), format: .currency(code: "USD"))
      .font(.title2)
    List(orders) { order in
      HStack {
        Text("\(order.ticketKey)-\(order.rowKey)").bold()
        Text(order.menuItem.name)
        Text(order.extendedPrice, format: .currency(code: "USD"))
      }
    }
  }
}

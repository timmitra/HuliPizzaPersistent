//
//  HuliPizzaPersistentApp.swift
//  HuliPizzaPersistent
//
//  Created by Steven Lipton on 10/27/23.
//

import SwiftUI
import SwiftData

@main
struct HuliPizzaPersistentApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
      // manages the storage
//        .modelContainer(for:[RatingModel.self, NameModel.self, OrderTicket.self, OrderItem.self], isAutosaveEnabled: false)
        .modelContainer(modelContainer)
    }
}

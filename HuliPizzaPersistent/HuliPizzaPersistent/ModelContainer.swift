//
//  ModelContainer.swift
//  HuliPizzaPersistent
//
//  Created by Tim Mitra on 2024-04-20.
//

import Foundation
import SwiftData

var modelContainer: ModelContainer {
  // add a schema
  let schema = Schema([OrderTicket.self, NameModel.self, RatingModel.self, OrderItem.self])
  let modelConfiguration = ModelConfiguration()
  let modelContainer = try! ModelContainer(for: schema, configurations: modelConfiguration)
  return modelContainer
}

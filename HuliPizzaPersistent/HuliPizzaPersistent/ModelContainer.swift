//
//  ModelContainer.swift
//  HuliPizzaPersistent
//
//  Created by Tim Mitra on 2024-04-20.
//

import Foundation
import SwiftData

typealias OrderTicket = HPSchemaV01_01_00.OrderTicket
typealias OrderItem = HPSchemaV01_01_00.OrderItem
typealias NameModel = HPSchemaV01_01_00.NameModel
typealias RatingModel = HPSchemaV01_01_00.RatingModel

var modelContainer: ModelContainer {
  // add a schema
//  let schema = Schema([OrderTicket.self, NameModel.self, RatingModel.self, OrderItem.self])
  let schema = Schema(versionedSchema: HPSchemaV01_01_00.self)
  let modelConfiguration = ModelConfiguration()
  let modelContainer = try! ModelContainer(for: schema, configurations: modelConfiguration)
  return modelContainer
}

var autoSaveModelContainer: ModelContainer {
  // add a schema
  let schema = Schema([OrderTicket.self, NameModel.self, RatingModel.self, OrderItem.self])
  let modelConfiguration = ModelConfiguration(isStoredInMemoryOnly: true)
  let modelContainer = try! ModelContainer(for: schema, configurations: modelConfiguration)
  let modelContext = ModelContext(modelContainer)
  modelContext.autosaveEnabled = true // by default false
  modelContext.insert(NameModel(name: "Steve", partySize: 3))
  modelContext.insert(NameModel(name: "Nova Aloha", partySize: 6))
  return modelContainer
}

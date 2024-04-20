//
//  HPSchemeV01_00_00.swift
//  HuliPizzaPersistent
//
//  Created by Tim Mitra on 2024-04-20.
//

import Foundation
import SwiftData

enum HPSchemeV01_00_00:VersionedSchema {
  
  static var models: [any PersistentModel.Type] {
    return [OrderTicket.self, OrderItem.self, NameModel.self, RatingModel.self]
  }
  
  static var versionIdentifier: Schema.Version = Schema.Version(1,0,0)
  
  
}

//
//  HPMigrationPlan.swift
//  HuliPizzaPersistent
//
//  Created by Tim Mitra on 2024-04-20.
//

import Foundation
import SwiftData

enum HPMigrationPlan: SchemaMigrationPlan {
  
  static var schemas: [any VersionedSchema.Type] {
    [HPSchemaV01_00_00.self,
     HPSchemaV01_01_00.self]
  }
  
  static var migrateV01_00_00to01_01_00: MigrationStage {
    MigrationStage.lightweight(fromVersion: HPSchemaV01_00_00.self, toVersion: HPSchemaV01_01_00.self)
  }
  
  static var stages: [MigrationStage] {
    // how to move between upgrades
    [migrateV01_00_00to01_01_00]
  }
}

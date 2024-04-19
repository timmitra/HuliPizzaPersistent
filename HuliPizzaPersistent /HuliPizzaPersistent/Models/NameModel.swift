//
//  NameModel.swift
//  minipizzaApp
//
//  Created by Steven Lipton on 10/17/23.
//

import Foundation
import SwiftData

@Model
class NameModel{
    var name:String
    var partySize:Int
    init(name: String, partySize: Int) {
        self.name = name
        self.partySize = partySize
    }
}

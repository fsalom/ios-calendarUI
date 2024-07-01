//
//  Item.swift
//  example
//
//  Created by Fernando Salom Carratala on 1/7/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

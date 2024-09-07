//
//  Category.swift
//  Pastify
//
//  Created by Hiren Rafaliya on 07/09/24.
//

import Foundation
import SwiftUI

struct Category {
    let id: String
    let name: String
    let createdOn: Date
    let order: Int
    let color: Int
    
    init(_ name: String) {
        self.id = UUID().uuidString
        self.name = name
        self.createdOn = Date.now
        self.order = 1
        self.color = Color.red.hashValue
    }
}

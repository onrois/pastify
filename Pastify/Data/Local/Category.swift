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
    var icon: String? = nil
    var color: String? = nil
    let isDefault: Bool = false
    
    init(_ name: String, icon: String? = nil, color: String? = nil) {
        self.id = UUID().uuidString
        self.name = name
        self.createdOn = Date.now
        self.order = 1
        self.icon = icon
        self.color = color
    }
}

//
//  Category.swift
//  Pastify
//
//  Created by Hiren Rafaliya on 07/09/24.
//

import Foundation
import SwiftUI

struct Category {
    let name: String
    let createdOn: Date
    
    init(_ name: String) {
        self.name = name
        self.createdOn = Date.now
    }
}

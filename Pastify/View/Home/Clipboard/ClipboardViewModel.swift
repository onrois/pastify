//
//  ClipboardViewModel.swift
//  Pastify
//
//  Created by Hiren Rafaliya on 07/09/24.
//

import Foundation

class ClipboardViewModel: ObservableObject {
    
    @Published private (set) var categories: [Category] = [
        Category("History"),
        Category("Important"),
        Category("Personal"),
        Category("Office")
    ]
    
    @Published var currentCategory : Category? = nil
}

//
//  ClipboardViewModel.swift
//  Pastify
//
//  Created by Hiren Rafaliya on 07/09/24.
//

import Foundation

class ClipboardViewModel: ObservableObject {
    
    @Published var categories: [Category] = [
        Category("History", icon: "clock.arrow.circlepath", isDefault: true),
        Category("Important"),
        Category("Personal"),
        Category("Office")
    ]
    
    @Published var currentCategory : Category? = nil
}

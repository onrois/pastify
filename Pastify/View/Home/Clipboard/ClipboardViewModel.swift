//
//  ClipboardViewModel.swift
//  Pastify
//
//  Created by Hiren Rafaliya on 07/09/24.
//

import Foundation

class ClipboardViewModel: ObservableObject {
    
    @Published var categories: [Board] = [
        Board("History", icon: "clock.arrow.circlepath", isDefault: true),
        Board("Important"),
        Board("Personal"),
        Board("Office")
    ]
    
    @Published var currentCategory : Board? = nil
}

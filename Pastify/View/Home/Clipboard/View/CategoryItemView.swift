//
//  CategoryItemView.swift
//  Pastify
//
//  Created by Hiren Rafaliya on 07/09/24.
//

import SwiftUI

struct CategoryItemView: View {
    let category: Category
    @Binding var currentCategory: Category?
    
    var body: some View {
        let isSelected = currentCategory?.name == category.name
        
        Text(category.name)
            .padding(.horizontal, 20)
            .padding(.vertical, 6)
            .background(isSelected ? .yellow.opacity(0.2) : .gray.opacity(0.2))
            .cornerRadius(8)
            .roundedBorder(isSelected ? .yellow.opacity(1) : .gray.opacity(1), radius: 8)
            .animation(.easeIn, value: UUID())
            .onTapGesture {
                currentCategory = category
            }
    }
}

#Preview {
    @State var currentCategory: Category? = Category("Default")
    
    return VStack {
        CategoryItemView(category: Category("Default"), currentCategory: $currentCategory)
    }
}

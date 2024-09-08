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
        
        HStack {
            colorDot(color: MyColor.accentPrimary)
            VSpacer(.small)
            Text(category.name)
                .font(.r16)
                .onTapGesture {
                    currentCategory = category
                }
        }
        .padding(.horizontal, Spacing.medium)
        .padding(.vertical, Spacing.small)
        .background(isSelected ? MyColor.accentPrimaryBg : MyColor.bgPrimary)
        .cornerRadius(Radius.medium)
        .roundedBorder(isSelected ? MyColor.accentPrimary : MyColor.bgTertiary, radius: Radius.medium)
        .foregroundColor(isSelected ? MyColor.textPrimary : MyColor.textPrimary)
        .animation(.easeIn, value: UUID())
    }
    
    func colorDot(color: Color) -> some View {
        Rectangle().frame(width: 10, height: 10)
            .foregroundColor(color).cornerRadius(Radius.round)
        
    }
}

#Preview {
    @State var currentCategory: Category? = Category("")
    
    return VStack {
        CategoryItemView(category: Category("Default"), currentCategory: $currentCategory)
    }
}

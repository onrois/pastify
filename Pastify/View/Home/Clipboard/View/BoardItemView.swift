//
//  CategoryItemView.swift
//  Pastify
//
//  Created by Hiren Rafaliya on 07/09/24.
//

import SwiftUI

struct BoardItemView: View {
    let category: Board
    @Binding var currentCategory: Board?
    
    var body: some View {
        let isSelected = currentCategory?.name == category.name
        
        Button(action: {currentCategory = category}, label: {
            HStack {
                if category.icon != nil {
                    Image(systemName: category.icon!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 16, height: 16)
                } else {
                    colorDot(color: MyColor.accentPrimary)
                }
                VSpacer(.small)
                Text(category.name)
                    .font(.r16)
            }
            .padding(.horizontal, Spacing.medium)
            .padding(.vertical, Spacing.small)
            .background(isSelected ? MyColor.accentPrimaryBg : MyColor.bgPrimary)
            .cornerRadius(Radius.medium)
            .roundedBorder(isSelected ? MyColor.accentPrimary : MyColor.bgTertiary, radius: Radius.medium)
            .foregroundColor(isSelected ? MyColor.textPrimary : MyColor.textPrimary)
            .animation(.easeIn, value: UUID())
            
        }).buttonStyle(.plain)
        
    }
    
    func colorDot(color: Color) -> some View {
        Rectangle().frame(width: 10, height: 10)
            .foregroundColor(color).cornerRadius(Radius.round)
        
    }
}

#Preview {
    @State var currentCategory: Board? = Board("")
    
    return VStack {
        BoardItemView(category: Board("Default"), currentCategory: $currentCategory)
    }
}

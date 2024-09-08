//
//  EditCategoryView.swift
//  Pastify
//
//  Created by Hiren Rafaliya on 08/09/24.
//

import SwiftUI

struct EditCategoryView: View {
    @Binding var categories: [Category]
    let onDismiss: () -> Void
    
    var body: some View {
        NavigationView {
            
            List {
                ForEach(categories, id: \.id) { category in
                    categoryItem(category: category)
                }.onMove(perform: { indices, newOffset in
                    categories.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    withAnimation(.spring, {
                        categories.remove(atOffsets: indexSet)
                    })
                })
            }.listStyle(.automatic)
            
                .navigationTitle("Category")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    Button("Done") {
                        onDismiss()
                    }.foregroundStyle(.accentPrimaryText)
                }
        }
    }
    
    func categoryItem(category: Category) -> some View {
        HStack {
            Image(systemName: "line.3.horizontal")
                .foregroundStyle(.textSecondary)
            
            VSpacer(.medium)
            
            if category.icon != nil {
                Image(systemName: category.icon!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 16, height: 16)
            } else {
                colorDot(color: MyColor.accentPrimary)
            }
            VSpacer(.medium)
            Text(category.name)
            Spacer()
            
            if !category.isDefault {
                Image(systemName: "minus.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.red)
                    .onTapGesture {
                        let ind = categories.firstIndex { item in
                            item.id == category.id
                        }
                        withAnimation(.spring, {
                            categories.remove(at: ind!)
                        })
                    }
                
            }
            
        }
    }
    
    func colorDot(color: Color) -> some View {
        Rectangle().frame(width: 16, height: 16)
            .foregroundColor(color).cornerRadius(Radius.round)
        
    }
}

#Preview {
    VStack {
        
    }
}

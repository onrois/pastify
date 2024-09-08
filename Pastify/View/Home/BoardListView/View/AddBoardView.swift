//
//  AddBoardView.swift
//  Pastify
//
//  Created by Hiren Rafaliya on 08/09/24.
//

import SwiftUI

struct AddBoardView: View {
    @Binding var board: Board?
    let onSave: () -> Void
    let onCancel: () -> Void
    
    @State private var text = ""
    
    var body : some View {
        VStack {
            TextField("Board Name", text: $text)
                .padding(.horizontal)
                .padding(.vertical, Spacing.small)
                .background (MyColor.bgSecondary)
                .clipShape(RoundedRectangle(cornerRadius: Radius.medium))
                .padding(.horizontal)
            
            Button(action: onSave, label: {
                Text("Save")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, Spacing.small)
                    .background(MyColor.accentPrimary)
                    .clipShape(RoundedRectangle(cornerRadius: Radius.medium))
            })
            .foregroundStyle(MyColor.bgPrimary)
            .padding(.horizontal)
            
            Button(action: onCancel, label: {
                Text("Cancel")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, Spacing.small)
                    .background(MyColor.accentPrimaryBg)
                    .clipShape(RoundedRectangle(cornerRadius: Radius.medium))
            })
            .foregroundStyle(MyColor.accentPrimary)
            .padding(.horizontal)
            
        }.frame(height: 200)
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .background(MyColor.bgPrimary)
            .clipShape(RoundedRectangle(cornerRadius: Radius.medium))
    }
}

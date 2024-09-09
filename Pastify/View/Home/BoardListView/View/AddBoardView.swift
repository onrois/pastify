//
//  AddBoardView.swift
//  Pastify
//
//  Created by Hiren Rafaliya on 08/09/24.
//

import SwiftUI

enum FocusedField {
    case first, second, third
}

struct AddBoardView: View {
    @Binding var board: Board?
    let onSave: () -> Void
    let onCancel: () -> Void
    let showEditBoard: Bool
    @FocusState var focusedField: FocusedField?

    
    @State private var text = ""
    
    var body : some View {
        VStack {
            TextField("Board Name", text: $text)
                .focused($focusedField, equals: .first)
                .padding(.horizontal)
                .padding(.vertical, Spacing.small)
                .background (MyColor.bgSecondary)
                .clipShape(RoundedRectangle(cornerRadius: Radius.medium))
                .padding(.horizontal)
            
            HSpacer(.large)
            
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
            
        }
        .frame(height: 200)
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .background(MyColor.bgPrimary)
        .clipShape(RoundedRectangle(cornerRadius: Radius.medium))
        .shadow(color: .textPrimary.opacity(0.20), radius: 12)
    }
}

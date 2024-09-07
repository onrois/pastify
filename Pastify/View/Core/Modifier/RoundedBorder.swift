//
//  RoundedBorder.swift
//  Pastify
//
//  Created by Hiren Rafaliya on 07/09/24.
//

import SwiftUI

extension View {
    func roundedBorder(_ color: Color, width: CGFloat = 1, radius: CGFloat) -> some View {
        self.overlay {
            RoundedRectangle(cornerRadius: radius)
                .inset(by: width / 2)
                .stroke(color, lineWidth: width, antialiased: true)
        }
    }
}

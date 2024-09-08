//
//  Font.swift
//  Pastify
//
//  Created by Hiren Rafaliya on 08/09/24.
//

import Foundation
import SwiftUI

struct FontStyle {
    let font: Font
    
    init(_ font: Font) {
        self.font = font
    }
}

extension FontStyle {
    static let r12 = FontStyle(Font.system(size: 12, weight: .regular, design: .rounded))
    static let r16 = FontStyle(Font.system(size: 16, weight: .regular, design: .rounded))
    static let r20 = FontStyle(Font.system(size: 20, weight: .regular, design: .rounded))
    static let r24 = FontStyle(Font.system(size: 24, weight: .regular, design: .rounded))
    
    static let m16 = FontStyle(Font.system(size: 16, weight: .medium, design: .rounded))
    static let m20 = FontStyle(Font.system(size: 20, weight: .medium, design: .rounded))
    
    static let b16 = FontStyle(Font.system(size: 16, weight: .bold, design: .rounded))
}

extension Text {
    func font(_ fontStyle: FontStyle) -> some View {
        self.font(fontStyle.font)
    }
}

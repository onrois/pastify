//
//  CustomSpacer.swift
//  Pastify
//
//  Created by Hiren Rafaliya on 08/09/24.
//

import Foundation
import SwiftUI

struct SpacingValue {
    let value: CGFloat
    
    init(_ value: CGFloat) {
        self.value = value
    }
}

extension SpacingValue {
    static let xSmall = SpacingValue(Spacing.xSmall)
    static let small = SpacingValue(Spacing.small)
    static let medium = SpacingValue(Spacing.medium)
    static let large = SpacingValue(Spacing.large)
    static let xLarge = SpacingValue(Spacing.xLarge)
    static let xxLarge = SpacingValue(Spacing.xxLarge)
}

struct HSpacer: View {
    let spacing: SpacingValue
    
    init(_ spacing: SpacingValue) {
        self.spacing = spacing
    }
    
    var body: some View {
        Spacer().frame(height: spacing.value)
    }
}

struct VSpacer: View {
    let spacing: SpacingValue
    
    init(_ spacing: SpacingValue) {
        self.spacing = spacing
    }
    
    var body: some View {
        Spacer().frame(width: spacing.value)
    }
}

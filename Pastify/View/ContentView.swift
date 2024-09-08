//
//  ContentView.swift
//  Pastify
//
//  Created by Hiren Rafaliya on 07/09/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HomeScreen()
            }
        }
        .tint(MyColor.accentPrimary)
    }
}

#Preview {
    ContentView()
}

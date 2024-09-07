//
//  ClipboardView.swift
//  Pastify
//
//  Created by Hiren Rafaliya on 07/09/24.
//

import SwiftUI

struct ClipboardView: View {
    
    @StateObject private var viewModel = ClipboardViewModel()
    
    var body: some View {
        NavigationView {
            VStack() {
                ScrollView(.horizontal, showsIndicators: false){
                    LazyHStack() {
                        ForEach(viewModel.categories, id: \.name) { category in
                            CategoryItemView(category: category, currentCategory: $viewModel.currentCategory)
                        }
                    }
                    .padding(.horizontal)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .fixedSize(horizontal: false, vertical: true)
                
                .navigationTitle("Clipboard")
            }
            .frame(maxHeight: .infinity, alignment: .topLeading)
        }
    }
}

#Preview {
    ClipboardView()
}

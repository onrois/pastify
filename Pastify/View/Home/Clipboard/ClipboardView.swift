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
            ScrollView(.vertical, showsIndicators: false) {
                VStack() {
                    HSpacer(.xSmall)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack() {
                            ForEach(viewModel.categories, id: \.name) { category in
                                CategoryItemView(category: category, currentCategory: $viewModel.currentCategory)
                            }
                        }
                        .padding(.horizontal)
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fixedSize(horizontal: false, vertical: true)
                    
                    
                    LazyVStack {
                        ForEach(0...20, id: \.self) { number in
                            Text(number.description)
                                .font(.r20)
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(MyColor.accentPrimaryBg)
                                .cornerRadius(Radius.medium)
                        }
                    }.padding()
                    
                        .navigationTitle("Clipboard")
                }
            }
            .frame(maxHeight: .infinity, alignment: .topLeading)
        }
    }
}

#Preview {
    ClipboardView()
}

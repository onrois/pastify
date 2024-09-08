//
//  ClipboardView.swift
//  Pastify
//
//  Created by Hiren Rafaliya on 07/09/24.
//

import SwiftUI

struct ClipboardView: View {
    
    @StateObject private var viewModel = ClipboardViewModel()
    @State private var isTitleInline = false
    
    
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
                    
                    dummyContent()
                    
                        .navigationTitle("Clipboard")
                    
                }
            }
            .frame(maxHeight: .infinity, alignment: .topLeading)
            .background(MyColor.bgSecondary)
        }
    }
    
    func dummyContent() -> some View {
        LazyVGrid(
            columns: [GridItem(.flexible()), GridItem(.flexible())]
        ) {
            ForEach(0...50, id: \.self) { number in
                Text(number.description)
                    .font(.r20)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(Radius.medium)
//                    .roundedBorder(MyColor.bgTertiary, radius: Radius.medium)
            }
        }.padding()
    }
    
}

#Preview {
    ClipboardView()
}

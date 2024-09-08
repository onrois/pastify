//
//  BoardListView.swift
//  Pastify
//
//  Created by Hiren Rafaliya on 08/09/24.
//

import SwiftUI

struct BoardListView: View {
    @Binding var boards: [Board]
    let onDismiss: () -> Void
    
    @State private var showEditBoard = false
    @State private var currentBoard: Board? = nil
    
    
    var body: some View {
        NavigationView {
            
            ZStack(alignment: .bottomTrailing) {
                List {
                    ForEach(boards, id: \.id) { board in
                        boardItem(board: board, action: {
                            currentBoard = board
                            withAnimation {
                                showEditBoard.toggle()
                            }
                        })
                    }.onMove(perform: { indices, newOffset in
                        boards.move(fromOffsets: indices, toOffset: newOffset)
                    })
                    .onDelete(perform: { indexSet in
                        boards.remove(atOffsets: indexSet)
                    })
                }.listStyle(.automatic)
                
                
                Button {
                    withAnimation {
                        showEditBoard.toggle()
                    }
                    
                } label: {
                    HStack {
                        Image(systemName: "plus")
                            .font(.title2.weight(.medium))
                    }
                    .padding()
                    .background(MyColor.accentPrimary)
                    .foregroundColor(MyColor.bgPrimary)
                    .clipShape(Circle())
                }
                .padding(.horizontal)
                
                
                ZStack {
                    AddBoardView(board: $currentBoard, onSave: {}, onCancel: {
                        withAnimation {
                            showEditBoard.toggle()
                        }
                    })
                    .opacity(showEditBoard ? 1 : 0)
                    .offset(y: showEditBoard ? 0 : UIScreen.main.bounds.height)
                    .animation(.spring, value: showEditBoard)
                }.frame(maxHeight: .infinity, alignment: .bottom)
                    .ignoresSafeArea(.container)
            }
            
            .navigationTitle("Boards")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Done") {
                    onDismiss()
                }.foregroundStyle(.accentPrimaryText)
            }
        }
    }
    
    func boardItem(board: Board, action: @escaping () -> Void) -> some View {
        Button (action: action) {
            HStack {
                Image(systemName: "line.3.horizontal")
                    .foregroundStyle(.textSecondary)
                
                VSpacer(.medium)
                
                if board.icon != nil {
                    Image(systemName: board.icon!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 16, height: 16)
                } else {
                    colorDot(color: MyColor.accentPrimary)
                }
                VSpacer(.medium)
                Text(board.name)
                Spacer()
                
                if !board.isDefault {
                    Image(systemName: "minus.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.red)
                        .onTapGesture {
                            let ind = boards.firstIndex { item in
                                item.id == board.id
                            }
                            _ = withAnimation(.spring) {
                                boards.remove(at: ind!)
                            }
                        }
                    
                }
            }.contentShape(Rectangle())
        }.buttonStyle(.plain)
        
        
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

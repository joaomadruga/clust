//
//  TabUsersView.swift
//  clust
//
//  Created by João Madruga on 21/04/23.
//

import SwiftUI

struct TabUsersView: View {
    let globalStyle: GlobalStyle
    let currentRoom: RoomModel
    
    let rows = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        TabView {
            if (currentRoom.roomMembers.count > 0) {
                ForEach(Array(stride(from: 0, to: currentRoom.roomMembers.count, by: 12)), id: \.self) { index in
                    VStack {
                        LazyVGrid(columns: rows, spacing: 16) {
                            if currentRoom.roomMembers.count - index > 12 {
                                ForEach(Array(stride(from: 0, to: 12, by: 1)), id: \.self) { secondIndex in
                                    VStack {
                                        RoundedMemojiView(base64String: currentRoom.roomMembers[secondIndex].memoji, backgroundIndex: Int.random(in: 0..<7), width: 40, height: 40)
                                        Text("\(currentRoom.roomMembers[secondIndex].name)")
                                            .font(.subheadline)
                                    }
                                }
                            } else {
                                ForEach(Array(stride(from: 0, to: currentRoom.roomMembers.count - index, by: 1)), id: \.self) { secondIndex in
                                    VStack {
                                        RoundedMemojiView(base64String: currentRoom.roomMembers[secondIndex].memoji, backgroundIndex: Int.random(in: 0..<7), width: 40, height: 40)
                                        Text("\(currentRoom.roomMembers[secondIndex].name)")
                                            .font(.subheadline)
                                    }
                                    
                                }
                            }
                        }
                        Spacer()
                    }
                    .padding(32)
                }
            } else {
                Text("Aguardando entrada de participantes...")
                    .padding(60)
                    .foregroundColor(globalStyle.systemGrey2)
                    .multilineTextAlignment(.center)
            }
        }
        .frame(maxHeight: 450)
        .background(globalStyle.systemGrey6)
        .cornerRadius(32)
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

struct TabUsersView_Previews: PreviewProvider {
    static var previews: some View {
        TabUsersView(globalStyle: .init(), currentRoom: .init(roomOwner: .init(), defineArea: .init(), roomOwnerName: "Kiev"))
    }
}

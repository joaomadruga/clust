//
//  ActiveRoomCardView.swift
//  clust
//
//  Created by José Cordeiro on 12/04/23.
//
import SwiftUI

struct ActiveRoomCardView: View {
    let globalStyle: GlobalStyle
    var room: RoomModel
    @EnvironmentObject var viewModel: FormGroupViewModel
    let userMemoji: String
    let userName: String
    
    let rows = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ScrollView(.horizontal, showsIndicators: false) {
                ZStack {
                    HStack {
                        if (room.roomMembers.count > 0) {
                            ForEach(room.roomMembers, id: \.self) { member in
                                RoundedMemojiView(base64String: member.memoji, backgroundIndex: Int.random(in: 0..<7), width: 90, height: 90)
                            }
                        } else {
                            ForEach((0...5), id: \.self) {_ in
                                Circle()
                                    .fill(Color(red: 0.772, green: 0.912, blue: 0.912, opacity: 1))
                                    .frame(width: 90, height: 90)
                            }
                        }
                    }
                    .padding([.trailing, .leading], 16)
                    Rectangle()
                        .fill(LinearGradient(
                            gradient: Gradient(colors: [.clear, globalStyle.lightGreen]),
                            startPoint: .center,
                            endPoint: .bottom))
                        .frame(maxWidth: .infinity)
                }
            }
            .padding([.trailing, .leading], -16)
            .frame(maxWidth: .infinity)
            
            
            
            
            VStack(alignment: .leading, spacing: 8) {
                Text(room.roomName)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(globalStyle.mainGreen)
                Text("Criada por \(room.roomOwnerName)")
                    .font(.subheadline)
                    .padding(.bottom, 16)
                Divider()
                NavigationLink(destination: AnyView(JoinedRoomScreenView(globalStyle: globalStyle, formGroupViewModel: viewModel, currentRoom: room, userMemoji: userMemoji, userName: userName).environmentObject(viewModel)).allScreensStyle()) {
                    LightGreenButtonView(globalStyle: globalStyle, text: "Entrar na sala")
                        .frame(maxWidth: .infinity)
                        .frame(alignment: .center)
                }.simultaneousGesture(TapGesture().onEnded{
                    viewModel.advertiseJoinRoom(room: room, userMemoji: userMemoji, userName: userName)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(16)
        .background(globalStyle.lightGreen)
        .cornerRadius(10)
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.05), radius: 10, y:8)
    }
}

struct ActiveRoomCardView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveRoomCardView(globalStyle: .init(), room: .init(roomOwner: .init(), defineArea: false, roomOwnerName: "Kiev"), viewModel: .init(), userMemoji: "", userName: "")
    }
}

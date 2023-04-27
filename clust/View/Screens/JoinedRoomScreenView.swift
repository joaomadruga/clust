//
//  JoinedRoomScreenView.swift
//  clust
//
//  Created by João Madruga on 20/04/23.
//

import SwiftUI
import Combine

struct JoinedRoomScreenView: View {
    let globalStyle: GlobalStyle
    let userMemoji: String
    let userName: String
    @ObservedObject var formGroupViewModel: FormGroupViewModel
    var currentRoom: RoomModel
    let MaxNumberOfItens = 12
    @State var viewModel: JoinedRoomScreenViewModel
    @State var showQuizScreen: Bool
    
    init(globalStyle: GlobalStyle, formGroupViewModel: FormGroupViewModel, currentRoom: RoomModel, userMemoji: String, userName: String) {
        self.globalStyle = globalStyle
        self.formGroupViewModel = formGroupViewModel
        self.currentRoom = currentRoom
        self.viewModel = JoinedRoomScreenViewModel()
        self.showQuizScreen = false
        self.userMemoji = userMemoji
        self.userName = userName
    }
    
    
    var body: some View {
        VStack {
            HeaderTitleView(text: currentRoom.roomName)
            Text("Aguardando a liderança da sala iniciar a formação de grupos...")
                .font(.subheadline)
                .foregroundColor(globalStyle.systemGrey2)
                .padding(.top, -20)
                .padding(.bottom, 20)
                
            TabUsersView(globalStyle: globalStyle, currentRoom: formGroupViewModel.availableRooms.first(where: { $0.roomOwner == currentRoom.roomOwner }) ?? RoomModel(roomName: "Default", roomOwner: currentRoom.roomOwner, defineArea: false, roomOwnerName: ""))
            
            Spacer()
        }
        .onReceive(Just(formGroupViewModel)) { newValue in
            // this works properly
            for room in formGroupViewModel.availableRooms {
                if (room.roomOwner == currentRoom.roomOwner && !room.isRoomOpen) {
                    print("entrei")
                    self.showQuizScreen = true
                }
            }
        }
        .navigationDestination(isPresented: $showQuizScreen) {
            AnyView(QuizMembersNumberView(globalStyle: globalStyle, quizUserModel: currentRoom.roomMembers.first(where: {$0.peerID.displayName == formGroupViewModel.peerID.displayName}) ?? QuizUserModel(peerID: .init(displayName: formGroupViewModel.peerID.displayName), memoji: userMemoji, name: userName), currentRoom: currentRoom, formGroupViewModel: formGroupViewModel)).allScreensStyle()
        }
    }
}

struct JoinedRoomScreenView_Previews: PreviewProvider {
    static var previews: some View {
        JoinedRoomScreenView(globalStyle: .init(), formGroupViewModel: .init(), currentRoom: .init(roomOwner: .init(), defineArea: .init(), roomOwnerName: "k"), userMemoji: "", userName: "").allScreensStyle()
    }
}

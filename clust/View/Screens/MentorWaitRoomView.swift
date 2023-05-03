//
//  MentorWaitRoomView.swift
//  clust
//
//  Created by João Madruga on 21/04/23.
//

import SwiftUI

struct MentorWaitRoomView: View {
    var globalStyle: GlobalStyle
    var createRoomViewModel: CreateRoomViewModel
    @State var viewModel: MentorWaitRoomViewModel
    var currentRoom: RoomModel
    
    init(globalStyle: GlobalStyle, createRoomViewModel: CreateRoomViewModel) {
        self.globalStyle = globalStyle
        self.createRoomViewModel = createRoomViewModel
        self.currentRoom = createRoomViewModel.formGroupViewModel.availableRooms.first(where: { $0.roomOwner == createRoomViewModel.formGroupViewModel.peerID }) ?? RoomModel(roomName: "Default", roomOwner: createRoomViewModel.formGroupViewModel.peerID, defineArea: false, roomOwnerName: "")
        self.viewModel = .init(formGroupViewModel: createRoomViewModel.formGroupViewModel)
    }
    
    let rows = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            HeaderTitleView(text: currentRoom.roomName)
            
            Text("Aguardando entrada de participantes. A sala aparecerá para os estudantes conectados na mesma rede WiFi.")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, -20)
                .foregroundColor(globalStyle.systemGrey2)
            
            TabUsersView(globalStyle: globalStyle, currentRoom: currentRoom)
            
            Spacer()
            
            MainButtonView(globalStyle: globalStyle, destinationScreen: LoadingScreenView(globalStyle: globalStyle, text: "Aguardando formação de equipes... ⏳🧭️", destinationScreen: MentorAllGroupsView(globalStyle: globalStyle, formGroupViewModel: createRoomViewModel.formGroupViewModel, currentRoom: currentRoom), formGroupViewModel: createRoomViewModel.formGroupViewModel, currentRoom: currentRoom, prevScreen: "MentorWaitRoomView").allScreensStyle(), backButtonText: "", buttonAction: {
                viewModel.advertiseStartQuiz(room: currentRoom)
            }, buttonText: "Iniciar formação de equipes")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct MentorWaitRoomView_Previews: PreviewProvider {
    static var previews: some View {
        MentorWaitRoomView(globalStyle: .init(), createRoomViewModel: .init(formGroupViewModel: .init()))
    }
}

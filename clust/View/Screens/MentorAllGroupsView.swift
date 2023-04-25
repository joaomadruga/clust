//
//  AllGroupsView.swift
//  clust
//
//  Created by José Cordeiro on 24/04/23.
//

import SwiftUI

struct MentorAllGroupsView: View {
    let globalStyle: GlobalStyle
    let formGroupViewModel: FormGroupViewModel
    let room: RoomModel
    
    init(globalStyle: GlobalStyle, formGroupViewModel: FormGroupViewModel, currentRoom: RoomModel) {
        self.globalStyle = globalStyle
        self.formGroupViewModel = formGroupViewModel
        self.room = formGroupViewModel.availableRooms.first(where: { $0.roomOwner == currentRoom.roomOwner }) ?? RoomModel(roomName: "Default", roomOwner: currentRoom.roomOwner, defineArea: false, roomOwnerName: "")
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                Text("Equipes Formadas").font(.headline).padding(16)
                ForEach (Array(room.listOfGroups.enumerated()), id: \.offset) { groupIndex, group in
                    GroupMembersView(globalStyle: .init(), groupName: "EQUIPE \(groupIndex + 1)", group: group)
                }
            }
        }
    }
}
    
struct MentorAllGroupsView_Previews: PreviewProvider {
    static var previews: some View {
        MentorAllGroupsView(globalStyle: .init(), formGroupViewModel: .init(), currentRoom: .init(roomOwner: .init(), defineArea: .init(), roomOwnerName: .init())).allScreensStyle()
    }
}

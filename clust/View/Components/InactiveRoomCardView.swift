//
//  InactiveRoomCardView.swift
//  clust
//
//  Created by João Madruga on 29/04/23.
//

import SwiftUI

struct InactiveRoomCardView: View {
    let globalStyle: GlobalStyle
    let formGroupViewModel: FormGroupViewModel
    let currentRoom: RoomModel
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("Challenge \(currentRoom.roomName)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title)
                        .multilineTextAlignment(.leading)
                    Text("Você e mais \(currentRoom.roomMembers.count - 1) integrantes.")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.footnote)
                        .foregroundColor(globalStyle.systemGrey2)
                }
                Spacer()
                NavigationLink(destination: AnyView(FormedGroupView(globalStyle: globalStyle, formGroupViewModel: formGroupViewModel, currentRoom: currentRoom)).allScreensStyle()) {
                    HStack {
                        HStack {
                            Text("Ver sua equipe")
                                .foregroundColor(globalStyle.systemGrey2)
                            Image(systemName: "chevron.right")
                                .foregroundColor(globalStyle.systemGrey2)
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                }
            }
            Divider()
        }
    }
}

struct InactiveRoomCardView_Previews: PreviewProvider {
    static var previews: some View {
        InactiveRoomCardView(globalStyle: .init(), formGroupViewModel: .init(), currentRoom: .init(roomOwner: .init(), defineArea: .init(), roomOwnerName: .init())).allScreensStyle()
    }
}

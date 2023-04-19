//
//  RoomsViewExample.swift
//  clust
//
//  Created by João Madruga on 09/04/23.
//

import SwiftUI

struct RoomsViewExample: View {
    @StateObject var vm = RoomViewModel()
    
    var body: some View {
        VStack {
            Button("Criar uma sala"){
                vm.advertiseCreateRoom()
            }
            List {
                Text("Lista de salas abertas")
                ForEach(vm.availableRooms, id: \.self) { room in
                    HStack {
                        Text(room.roomName)
                        Text("Peers in room:")
                        ForEach(room.roomMembers, id: \.self) { member in
                            Text(member.displayName)
                        }
                        Spacer()
                        Text("entrar")
                    }
                }
                Divider()
                Text("Lista de usuários ON")
                ForEach(vm.availablePeers, id: \.self) { peer in
                    HStack {
                        Text(peer.displayName)
                    }
                }
            }
        }
    }
}

struct RoomsViewExample_Previews: PreviewProvider {
    static var previews: some View {
        RoomsViewExample()
    }
}

//
//  CreateRoomViewModel.swift
//  clust
//
//  Created by João Madruga on 21/04/23.
//

import SwiftUI
import MultipeerConnectivity

class CreateRoomViewModel: NSObject, ObservableObject {
    @ObservedObject var formGroupViewModel: FormGroupViewModel
    
    init(formGroupViewModel: FormGroupViewModel) {
        self.formGroupViewModel = formGroupViewModel
    }
    
    func advertiseCreateRoom(roomName: String, defineArea: Bool, roomOwnerName: String) {
        // avisa aos outros peers que já estão em browsing (procurando) que eu criei uma nova sala.
        let newRoom: RoomModel = .init(roomName: roomName, roomMembers: [], isRoomOpen: true, roomOwner: formGroupViewModel.peerID, defineArea: defineArea, roomOwnerName: roomOwnerName)
        formGroupViewModel.availableRooms.append(newRoom)
        print(formGroupViewModel.availablePeers)
        do {
            let encodedData = try NSKeyedArchiver.archivedData(withRootObject: newRoom, requiringSecureCoding: true)
            try formGroupViewModel.session.send(encodedData, toPeers: formGroupViewModel.availablePeers, with: .reliable)
        } catch let error {
            print("Error sending data: \(error.localizedDescription)")
        }
    }
}

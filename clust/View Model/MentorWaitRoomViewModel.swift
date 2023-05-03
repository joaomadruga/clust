//
//  MentorWaitRoomViewModel.swift
//  clust
//
//  Created by João Madruga on 21/04/23.
//

import SwiftUI
import MultipeerConnectivity

class MentorWaitRoomViewModel: NSObject, ObservableObject {
    @ObservedObject var formGroupViewModel: FormGroupViewModel
    
    init(formGroupViewModel: FormGroupViewModel) {
        self.formGroupViewModel = formGroupViewModel
    }
    
    func advertiseStartQuiz(room: RoomModel) {
        do {
            for currentRoom in formGroupViewModel.availableRooms {
                if (currentRoom.roomOwner == room.roomOwner) {
                    currentRoom.isRoomOpen = false
                    let encodedData = try NSKeyedArchiver.archivedData(withRootObject: currentRoom, requiringSecureCoding: true)
                    try formGroupViewModel.session.send(encodedData, toPeers: formGroupViewModel.availablePeers, with: .reliable)
                }
            }
        } catch let error {
            print("Error sending data: \(error.localizedDescription)")
        }
    }
}

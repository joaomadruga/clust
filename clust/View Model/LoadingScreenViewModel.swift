//
//  LoadingScreenViewModel.swift
//  clust
//
//  Created by João Madruga on 24/04/23.
//

import SwiftUI

class LoadingScreenViewModel: ObservableObject {
    @ObservedObject var formGroupViewModel: FormGroupViewModel
    var currentRoom: RoomModel
    
    init(formGroupViewModel: FormGroupViewModel, currentRoom: RoomModel) {
        self.formGroupViewModel = formGroupViewModel
        self.currentRoom = currentRoom
    }
    
    func waitArea() -> Bool {
        for room in formGroupViewModel.availableRooms {
            if (room.roomOwner == currentRoom.roomOwner) {
                for member in room.roomMembers {
                    print("/////")
                    print(member.learningTopic)
                    print(member.learningArea)
                    print(member.numberOfGroupMembers)
                    print("/////")
                    if (member.learningTopic == "" || member.learningArea == "" || member.numberOfGroupMembers == 0) {
                        print("entrei onde não devia")
                        return true
                    }
                }
            }
        }
        return false
    }
    
    func waitListOfTopics() -> Bool {
        for room in formGroupViewModel.availableRooms {
            if (room.roomOwner == currentRoom.roomOwner && room.listOfGroups.count == 0) {
                for member in room.roomMembers {
                    print(member.listOfPreferredTopics.count)
                    if (member.listOfPreferredTopics.count == 0) {
                        return true
                    }
                }
            }
        }
        return false
    }
    
    func waitFormGroups() -> Bool {
        for room in formGroupViewModel.availableRooms {
            if (room.roomOwner == currentRoom.roomOwner) {
                for member in room.roomMembers {
                    if (member.learningTopic == "" || member.learningArea == "" || member.numberOfGroupMembers == 0 || member.listOfPreferredTopics.count < 3) {
                        return true
                    }
                }
            }
        }
        formGroupViewModel.advertiseGroupsFormed()
        return false
    }
}

//
//  RoomModel.swift
//  clust
//
//  Created by João Madruga on 10/04/23.
//

import Foundation
import SwiftUI
import MultipeerConnectivity

class RoomModel: NSObject, NSSecureCoding {
    
    var roomName: String
    var roomOwnerName: String
    var roomOwner: MCPeerID
    var roomMembers: [QuizUserModel]
    var isRoomOpen: Bool
    var defineArea: Bool
    var listOfGroups: [GroupModel]

    init(roomName: String = "", roomMembers: [QuizUserModel] = [], isRoomOpen: Bool = true, roomOwner: MCPeerID, defineArea: Bool, roomOwnerName: String, listOfGroups: [GroupModel] = []) {
        self.roomName = roomName
        self.roomOwnerName = roomOwnerName
        self.roomMembers = roomMembers
        self.isRoomOpen = isRoomOpen
        self.roomOwner = roomOwner
        self.defineArea = defineArea
        self.listOfGroups = listOfGroups
    }
    
    static var supportsSecureCoding: Bool {
       return true
    }

    required convenience init?(coder decoder: NSCoder) {
        guard let roomName = decoder.decodeObject(forKey: "roomName") as? String,
              let roomOwnerName = decoder.decodeObject(forKey: "roomOwnerName") as? String,
              let roomMembersData = decoder.decodeObject(forKey: "roomMembers") as? Data,
              let roomOwnerData = decoder.decodeObject(forKey: "roomOwner") as? Data,
              let roomMembers = try? NSKeyedUnarchiver.unarchivedArrayOfObjects(ofClass: QuizUserModel.self, from: roomMembersData),
              let roomOwner = try? NSKeyedUnarchiver.unarchivedObject(ofClass: MCPeerID.self, from: roomOwnerData),
              let listOfGroupsData = decoder.decodeObject(forKey: "listOfGroups") as? Data,
              let listOfGroups = try? NSKeyedUnarchiver.unarchivedArrayOfObjects(ofClass: GroupModel.self, from: listOfGroupsData)
        else {
            return nil
        }
        let isRoomOpen = decoder.decodeBool(forKey: "isRoomOpen")
        let defineArea = decoder.decodeBool(forKey: "defineArea")
        self.init(roomName: roomName, roomMembers: roomMembers, isRoomOpen: isRoomOpen, roomOwner: roomOwner, defineArea: defineArea, roomOwnerName: roomOwnerName, listOfGroups: listOfGroups)
    }


    func encode(with encoder: NSCoder) {
        encoder.encode(roomName, forKey: "roomName")
        encoder.encode(roomOwnerName, forKey: "roomOwnerName")
        encoder.encode(isRoomOpen, forKey: "isRoomOpen")
        encoder.encode(defineArea, forKey: "defineArea")
        
        let roomMembersData = try? NSKeyedArchiver.archivedData(withRootObject: roomMembers, requiringSecureCoding: true)
        let roomOwnerData = try? NSKeyedArchiver.archivedData(withRootObject: roomOwner, requiringSecureCoding: true)
        let listOfGroupsData = try? NSKeyedArchiver.archivedData(withRootObject: listOfGroups, requiringSecureCoding: true)
        encoder.encode(listOfGroupsData, forKey: "listOfGroups")
        encoder.encode(roomMembersData, forKey: "roomMembers")
        encoder.encode(roomOwnerData, forKey: "roomOwner")
    }

}

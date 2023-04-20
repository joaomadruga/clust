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
    var roomMembers: [MCPeerID]
    var isRoomOpen: Bool

    init(roomName: String = "", roomMembers: [MCPeerID] = [], isRoomOpen: Bool = false) {
        self.roomName = roomName
        self.roomMembers = roomMembers
        self.isRoomOpen = isRoomOpen
    }
    
    static var supportsSecureCoding: Bool {
       return true
    }

    required convenience init?(coder decoder: NSCoder) {
        guard let roomName = decoder.decodeObject(forKey: "roomName") as? String,
            let roomMembersData = decoder.decodeObject(forKey: "roomMembers") as? Data,
            let roomMembers = try? NSKeyedUnarchiver.unarchivedArrayOfObjects(ofClass: MCPeerID.self, from: roomMembersData)
        else {
            return nil
        }
        let isRoomOpen = decoder.decodeBool(forKey: "isRoomOpen")
        self.init(roomName: roomName, roomMembers: roomMembers, isRoomOpen: isRoomOpen)
    }


    func encode(with encoder: NSCoder) {
        encoder.encode(roomName, forKey: "roomName")
        let roomMembersData = try? NSKeyedArchiver.archivedData(withRootObject: roomMembers, requiringSecureCoding: true)
        encoder.encode(roomMembersData, forKey: "roomMembers")
        encoder.encode(isRoomOpen, forKey: "isRoomOpen")
    }

}

//
//  FormGroupViewModel.swift
//  clust
//
//  Created by João Madruga on 21/04/23.
//

import Swift
import SwiftUI
import MultipeerConnectivity

class FormGroupViewModel: NSObject, ObservableObject {
    private let serviceType = "rps-service"
    public var peerID: MCPeerID
    
    
    public let session: MCSession
    public let nearbyServiceAdvertiser: MCNearbyServiceAdvertiser
    public let nearbyServiceBrowser: MCNearbyServiceBrowser
    
    @Published var availablePeers: [MCPeerID] = []
    @Published var availableRooms: [RoomModel] = []
    
    override init() {
        let peerID = MCPeerID(displayName: UUID().uuidString)
        self.peerID = peerID
        
        session = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .required)
        nearbyServiceAdvertiser = MCNearbyServiceAdvertiser(peer: peerID, discoveryInfo: nil, serviceType: serviceType)
        nearbyServiceBrowser = MCNearbyServiceBrowser(peer: peerID, serviceType: serviceType)
        super.init()
        
        session.delegate = self
        nearbyServiceAdvertiser.delegate = self
        nearbyServiceBrowser.delegate = self
        
        nearbyServiceBrowser.startBrowsingForPeers()
        nearbyServiceAdvertiser.startAdvertisingPeer()
    }
    
    deinit {
        print("stopped")
        nearbyServiceAdvertiser.stopAdvertisingPeer()
        nearbyServiceBrowser.stopBrowsingForPeers()
    }
    
    func advertise(peer: MCPeerID) {
        do {
            for room in availableRooms {
                let encodedData = try NSKeyedArchiver.archivedData(withRootObject: room, requiringSecureCoding: true)
                try self.session.send(encodedData, toPeers: [peer], with: .reliable)
            }
        } catch let error {
            print("Error sending data: \(error.localizedDescription)")
        }
    }
    
    func advertiseLeftRoom(peer: MCPeerID) {
        do {
            for (roomIndex, room) in availableRooms.enumerated() {
                for (memberIndex, member) in room.roomMembers.enumerated() {
                    if member.peerID.displayName == peer.displayName {
                        room.roomMembers.remove(at: memberIndex)
                        availableRooms[roomIndex] = room
                        let encodedData = try NSKeyedArchiver.archivedData(withRootObject: room, requiringSecureCoding: true)
                        try self.session.send(encodedData, toPeers: availablePeers, with: .reliable)
                    }
                }
                
            }
        } catch let error {
            print("Error sending data: \(error.localizedDescription)")
        }
    }
    
    func advertiseJoinRoom(room: RoomModel, userMemoji: String, userName: String) {
        let updatedRoom: RoomModel = .init(roomName: room.roomName, roomMembers: room.roomMembers + [QuizUserModel(peerID: peerID, memoji: userMemoji, name: userName)], isRoomOpen: room.isRoomOpen, roomOwner: room.roomOwner, defineArea: room.defineArea, roomOwnerName: room.roomOwnerName)
        
        print("se for aqui, mostre!")
        print(updatedRoom.roomMembers)
        
        var exist = false
        for index in availableRooms.indices {
            if availableRooms[index].roomOwner == updatedRoom.roomOwner {
                availableRooms[index] = updatedRoom
                exist = true
            }
        }
        if !exist {
            availableRooms.append(updatedRoom)
        }
        
        do {
            let encodedData = try NSKeyedArchiver.archivedData(withRootObject: updatedRoom, requiringSecureCoding: true)
            try self.session.send(encodedData, toPeers: self.availablePeers, with: .reliable)
        } catch let error {
            print("Error sending data: \(error.localizedDescription)")
        }
    }
    
    func calculteMode(room: RoomModel) -> Int {
        // [1, 2, 3, 4, 2, 2]
        // [1: 1, 2: 3, 3: 1, 4: 1]
        var mostRepeatedNumber: Dictionary<Int, Int> = [:]
        var biggestNumber: Int = -1
        
        for member in room.roomMembers {
            if (biggestNumber == -1) {
                biggestNumber = member.numberOfGroupMembers
            }
            if (mostRepeatedNumber.contains(where:{ $0.value == member.numberOfGroupMembers})) {
                mostRepeatedNumber[member.numberOfGroupMembers]! += 1
                if (mostRepeatedNumber[member.numberOfGroupMembers]! > mostRepeatedNumber[biggestNumber]!) {
                    biggestNumber = member.numberOfGroupMembers
                }
            } else {
                mostRepeatedNumber[member.numberOfGroupMembers] = 1
            }
        }
        
        return biggestNumber
    }
    
    func formGroups() -> [GroupModel] {
        // essa função só deve ser rodada pelo lado do mentor
        // 5 // 2 =
        
        for room in self.availableRooms {
            if (room.roomOwner.displayName == self.peerID.displayName) {
                let groupSize = self.calculteMode(room: room)
                print(groupSize)
                var shuffledMembers = room.roomMembers.shuffled() // shuffle the members array
                var groups = [GroupModel]() // array to hold the groups
                
                while shuffledMembers.count >= groupSize {
                    let members = Array(shuffledMembers.prefix(groupSize)) // take the first n members from the shuffled array
                    groups.append(GroupModel(members: members)) // add the group to the array of groups
                    shuffledMembers.removeFirst(groupSize) // remove the members that were added to the group
                }
                
                // if there are any remaining members, add them to a group
                if shuffledMembers.count > 0 {
                    groups.append(GroupModel(members: shuffledMembers))
                }
                print(groups)
                return groups
            }
        }
        return []
    }
    
    func advertiseGroupsFormed() {
        do {
            for room in self.availableRooms {
                if (room.roomOwner.displayName == self.peerID.displayName) {
                    room.listOfGroups = formGroups()
                    let encodedData = try NSKeyedArchiver.archivedData(withRootObject: room, requiringSecureCoding: true)
                    try self.session.send(encodedData, toPeers: availablePeers, with: .reliable)
                }
            }
        } catch let error {
            print("Error sending data: \(error.localizedDescription)")
        }
    }
}

extension FormGroupViewModel: MCSessionDelegate {
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        print("peer \(peerID) didChangeState: \(state.rawValue)")
        switch state {
        case .connecting:
            print("\(peerID) state: connecting")
        
        case .connected:
            print("\(peerID) state: connected")
            self.advertise(peer: peerID)
        
        case .notConnected:
            print("\(peerID) state: not connected")
            self.advertiseLeftRoom(peer: peerID)
        
        @unknown default:
            print("\(peerID) state: unknown")
        }
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        DispatchQueue.main.async {
            do {
                print(data)
                let decodedData = try NSKeyedUnarchiver.unarchivedObject(ofClass: RoomModel.self, from: data)

                if let decodedData = decodedData {
                    print("Received data: \(decodedData.roomName)")
                    var exist = false
                    for index in self.availableRooms.indices {
                        if self.availableRooms[index].roomOwner == decodedData.roomOwner {
                            self.availableRooms[index] = decodedData
                            exist = true
                        }
                    }
                    if !exist {
                        self.availableRooms.append(decodedData)
                    }
                    print("funcionou.")
                    print(self.availableRooms)
                    print(self.availableRooms[0].roomMembers)
                    // do something with the unarchived object
                } else {
                    print("Unable to unarchive object")
                }
            } catch let error {
                print("Error unarchiving object: \(error)")
            }
        }
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        
    }
}

extension FormGroupViewModel: MCNearbyServiceAdvertiserDelegate {
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didNotStartAdvertisingPeer error: Error) {
        print("ServiceAdvertiser didNotStartAdvertisingPeer: \(String(describing: error))")
    }
    
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        print("didReceiveInvitationFromPeer \(peerID)")
        
        DispatchQueue.main.async {
            invitationHandler(true, self.session)
        }
    }
}

extension FormGroupViewModel: MCNearbyServiceBrowserDelegate {
    func browser(_ browser: MCNearbyServiceBrowser, didNotStartBrowsingForPeers error: Error) {
        print("ServiceBroser didNotStartBrowsingForPeers: \(String(describing: error))")
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        print("ServiceBrowser found peer: \(peerID)")
        // Add the peer to the list of available peers
        DispatchQueue.main.async {
            self.nearbyServiceBrowser.invitePeer(peerID, to: self.session, withContext: nil, timeout: 30)
            self.availablePeers.append(peerID)
        }
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        print("ServiceBrowser lost peer: \(peerID)")
        // Remove lost peer from list of available peers
        DispatchQueue.main.async {
            self.availablePeers.removeAll(where: {
                $0 == peerID
            })
        }
    }
}

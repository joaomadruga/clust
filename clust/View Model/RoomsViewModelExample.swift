//
//  RoomsViewModelExample.swift
//  clust
//
//  Created by João Madruga on 09/04/23.
//

import SwiftUI
import MultipeerConnectivity

class RoomViewModel: NSObject, ObservableObject {
    private let serviceType = "rps-service"
    private var peerID: MCPeerID
    
    
    public let session: MCSession
    public let nearbyServiceAdvertiser: MCNearbyServiceAdvertiser
    public let nearbyServiceBrowser: MCNearbyServiceBrowser
    
    @Published var availablePeers: [MCPeerID] = []
    @Published var availableRooms: [RoomModel] = []
    
    override init() {
        let peerID = MCPeerID(displayName: UIDevice.current.name)
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
        nearbyServiceAdvertiser.stopAdvertisingPeer()
        nearbyServiceBrowser.stopBrowsingForPeers()
    }
    
    func advertise() {
    }
    
    func advertiseCreateRoom() {
        // avisa aos outros peers que já estão em browsing (procurando) que eu criei uma nova sala.
        let newRoom: RoomModel = .init(roomName: "Foundations", roomMembers: availablePeers, isRoomOpen: true)
        
        do {
            let encodedData = try NSKeyedArchiver.archivedData(withRootObject: newRoom, requiringSecureCoding: true)
            try session.send(encodedData, toPeers: availablePeers, with: .reliable)
            availableRooms.append(newRoom)
        } catch let error {
            print("Error sending data: \(error.localizedDescription)")
        }
    }
}

extension RoomViewModel: MCSessionDelegate {
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        print("peer \(peerID) didChangeState: \(state.rawValue)")
        switch state {
        case .connecting:
            print("\(peerID) state: connecting")
        
        case .connected:
            print("\(peerID) state: connected")
        
        case .notConnected:
            print("\(peerID) state: not connected")
        
        @unknown default:
            print("\(peerID) state: unknown")
        }
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        do {
            print(data)
            let decodedData = try NSKeyedUnarchiver.unarchivedObject(ofClass: RoomModel.self, from: data)

            if let decodedData = decodedData {
                print("Received data: \(decodedData.roomName)")
                availableRooms.append(decodedData)
                // do something with the unarchived object
            } else {
                print("Unable to unarchive object")
            }
        } catch let error {
            print("Error unarchiving object: \(error)")
        }
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        
    }
}

extension RoomViewModel: MCNearbyServiceAdvertiserDelegate {
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

extension RoomViewModel: MCNearbyServiceBrowserDelegate {
    func browser(_ browser: MCNearbyServiceBrowser, didNotStartBrowsingForPeers error: Error) {
        print("ServiceBroser didNotStartBrowsingForPeers: \(String(describing: error))")
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        print("ServiceBrowser found peer: \(peerID)")
        // Add the peer to the list of available peers
        DispatchQueue.main.async {
            self.availablePeers.append(peerID)
            self.nearbyServiceBrowser.invitePeer(peerID, to: self.session, withContext: nil, timeout: 30)
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

//
//  QuizUserModel.swift
//  clust
//
//  Created by João Madruga on 22/03/23.
//

import Foundation
import MultipeerConnectivity

class QuizUserModel: NSObject, ObservableObject, NSSecureCoding {
    var numberOfGroupMembers: Int
    var learningArea: String
    var learningTopic: String
    var listOfPreferredTopics: [String]
    var peerID: MCPeerID
    var memoji: String
    var name: String
    
    init(numberOfGroupMembers: Int = 0, learningArea: String = "", learningTopic: String = "", listOfPreferredTopics: [String] = [], peerID: MCPeerID, memoji: String = "", name: String = "") {
        self.numberOfGroupMembers = numberOfGroupMembers
        self.learningArea = learningArea
        self.learningTopic = learningTopic
        self.listOfPreferredTopics = listOfPreferredTopics
        self.peerID = peerID
        self.memoji = memoji
        self.name = name
    }
    
    static var supportsSecureCoding: Bool {
       return true
    }
    
    func insertNumberOfGroupMembers(numberOfGroupMembers: Int) {
        self.numberOfGroupMembers = numberOfGroupMembers
    }
    
    func insertLearningArea(learningArea: String) {
        self.learningArea = learningArea
    }
    
    func insertLearningTopic(learningTopic: String) {
        self.learningTopic = learningTopic
    }
    
    func insertListOfPreferredTopics(listOfPreferredTopics: [String]) {
        self.listOfPreferredTopics = listOfPreferredTopics
    }
    
    required convenience init?(coder decoder: NSCoder) {
        
        guard let learningArea = decoder.decodeObject(forKey: "learningArea") as? String,
              let learningTopic = decoder.decodeObject(forKey: "learningTopic") as? String,
              let memoji = decoder.decodeObject(forKey: "memoji") as? String,
              let name = decoder.decodeObject(forKey: "name") as? String,
              let peerIDData = decoder.decodeObject(forKey: "peerID") as? Data,
              let peerID = try? NSKeyedUnarchiver.unarchivedObject(ofClass: MCPeerID.self, from: peerIDData),
              let listOfPreferredTopicsData = decoder.decodeObject(forKey: "listOfPreferredTopics") as? Data,
              let listOfPreferredTopics = try? NSKeyedUnarchiver.unarchivedObject(ofClass: NSArray.self, from: listOfPreferredTopicsData) as? [String]
        else {
            return nil
        }
        let numberOfGroupMembers = decoder.decodeInteger(forKey: "numberOfGroupMembers")
        self.init(numberOfGroupMembers: numberOfGroupMembers, learningArea: learningArea, learningTopic: learningTopic, listOfPreferredTopics: listOfPreferredTopics, peerID: peerID, memoji: memoji, name: name)
    }


    func encode(with encoder: NSCoder) {
        encoder.encode(learningArea, forKey: "learningArea")
        encoder.encode(learningTopic, forKey: "learningTopic")
        encoder.encode(numberOfGroupMembers, forKey: "numberOfGroupMembers")
        encoder.encode(memoji, forKey: "memoji")
        encoder.encode(name, forKey: "name")
        
        let listOfPreferredTopicsData = try? NSKeyedArchiver.archivedData(withRootObject: listOfPreferredTopics, requiringSecureCoding: true)
        encoder.encode(listOfPreferredTopicsData, forKey: "listOfPreferredTopics")
        
        let peerIDData = try? NSKeyedArchiver.archivedData(withRootObject: peerID, requiringSecureCoding: true)
        encoder.encode(peerIDData, forKey: "peerID")

    }
}

//
//  ListOfTopicsViewModel.swift
//  clust
//
//  Created by João Madruga on 25/03/23.
//

import SwiftUI
import MultipeerConnectivity

class ListOfTopicsViewModel: ObservableObject {
    var quizUserModel: QuizUserModel
    var topicsModel: TopicsModel
    @ObservedObject var formGroupViewModel: FormGroupViewModel
    let currentRoom: RoomModel
    
    init(searchText: Binding<String>, quizUserModel: QuizUserModel, currentRoom: RoomModel, formGroupViewModel: FormGroupViewModel) {
        self.topicsModel = .init(searchText: searchText)
        self.quizUserModel = quizUserModel
        self.formGroupViewModel = formGroupViewModel
        self.currentRoom = currentRoom
    }
    
    var searchResults: [String] {
        if topicsModel.searchText.wrappedValue.isEmpty {
            return []
        }
        
        let cleanedInput = topicsModel.searchText.wrappedValue.lowercased().trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: " ", with: "")
        return topicsModel.listOfTopics.filter {
            let cleanedOption = $0.lowercased().trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: " ", with: "")
            return cleanedOption.contains(cleanedInput)
        }
    }
    
    func selectCurrentOption(showLoadingScreenView: Binding<Bool>) {
        self.advertiseQuizUserModel()
        showLoadingScreenView.wrappedValue = true
    }
    
    func advertiseQuizUserModel() {
        do {
            for room in formGroupViewModel.availableRooms {
                if (room.roomOwner == currentRoom.roomOwner) {
                    for (memberIndex, member) in room.roomMembers.enumerated() {
                        print(member.peerID.displayName)
                        print(formGroupViewModel.peerID.displayName)
                        if (member.peerID.displayName == formGroupViewModel.peerID.displayName) {
                            quizUserModel.insertLearningTopic(learningTopic: topicsModel.searchText.wrappedValue)
                            room.roomMembers[memberIndex] = quizUserModel
                        }
                    }
                    let encodedData = try NSKeyedArchiver.archivedData(withRootObject: room, requiringSecureCoding: true)
                    try self.formGroupViewModel.session.send(encodedData, toPeers: formGroupViewModel.availablePeers, with: .reliable)
                }
            }
        } catch let error {
            print("Error sending data: \(error.localizedDescription)")
        }
    }
}

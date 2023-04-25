//
//  ChooseTopThreeTopicsViewModel.swift
//  clust
//
//  Created by João Madruga on 03/04/23.
//

import Foundation
import SwiftUI

extension ChooseTopThreeTopicsView {
    class ChooseTopThreeTopicsViewModel: ObservableObject {
        @ObservedObject var quizUserModel: QuizUserModel
        @Published var listOfSelections: [OptionModel] = []
        @ObservedObject var formGroupViewModel: FormGroupViewModel
        var numberOfSelectedChoices: Int = 0
        var auxListOfSelections: Set = Set<String>()
        let currentRoom: RoomModel
        
        init(quizUserModel: QuizUserModel, formGroupViewModel: FormGroupViewModel, currentRoom: RoomModel) {
            self.quizUserModel = quizUserModel
            self.formGroupViewModel = formGroupViewModel
            self.currentRoom = currentRoom
        }
        
        func loadListOfSelections() {
            for room in formGroupViewModel.availableRooms {
                if (currentRoom.roomOwner == room.roomOwner) {
                    print(room.roomMembers)
                    for (memberIndex, member) in room.roomMembers.enumerated() {
                        print(member.learningTopic)
                        if (!auxListOfSelections.contains(member.learningTopic) && member.learningTopic != "") {
                            listOfSelections.append(.init(index: memberIndex, text: member.learningTopic))
                            auxListOfSelections.insert(member.learningTopic)
                        }
                    }
                    break
                }
            }
        }
        
        func onClickButton() {
            var listOfPreferredTopics: [String] = []
            for index in self.listOfSelections.indices {
                if self.listOfSelections[index].isChecked {
                    listOfPreferredTopics.append(self.listOfSelections[index].text)
                }
            }
            self.advertiseQuizUserModel(listOfPreferredTopics: listOfPreferredTopics)
        }
        
        func advertiseQuizUserModel(listOfPreferredTopics: [String]) {
            do {
                for room in formGroupViewModel.availableRooms {
                    if (room.roomOwner == currentRoom.roomOwner) {
                        for (memberIndex, member) in room.roomMembers.enumerated() {
                            if (member.peerID.displayName == formGroupViewModel.peerID.displayName) {
                                quizUserModel.insertListOfPreferredTopics(listOfPreferredTopics: listOfPreferredTopics)
                                room.roomMembers[memberIndex] = quizUserModel
                            }
                        }
                        print("enviei")
                        let encodedData = try NSKeyedArchiver.archivedData(withRootObject: room, requiringSecureCoding: true)
                        try self.formGroupViewModel.session.send(encodedData, toPeers: formGroupViewModel.availablePeers, with: .reliable)
                    }
                }
            } catch let error {
                print("Error sending data: \(error.localizedDescription)")
            }
        }
        
        func selectCurrentButton(index: Int) {
            if numberOfSelectedChoices < 3 {
                if !listOfSelections[index].isChecked {
                    numberOfSelectedChoices += 1
                }
                listOfSelections[index].isChecked = true
                
            } else if numberOfSelectedChoices >= 3 && listOfSelections[index].isChecked {
                if listOfSelections[index].isChecked {
                    numberOfSelectedChoices -= 1
                }
                listOfSelections[index].isChecked = false
            }
        }
    }
}

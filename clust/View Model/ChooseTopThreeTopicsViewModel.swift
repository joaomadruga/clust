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
        @Published var quizUserModel: QuizUserModel
        @Published var listOfSelections: [OptionModel] = [.init(index: 0, text: "Wallet"), .init(index: 1, text: "Swift UI"), .init(index: 2, text: "AR/VR"), .init(index: 3, text: "Gestures"), .init(index: 4, text: "Wallet"), .init(index: 5, text: "Swift UI"), .init(index: 6, text: "AR/VR"), .init(index: 7, text: "Gestures"), .init(index: 8, text: "Wallet"), .init(index: 9, text: "Swift UI"), .init(index: 10, text: "AR/VR"), .init(index: 11, text: "Gestures")]
        var numberOfSelectedChoices:Int = 0
        init(quizUserModel: QuizUserModel) {
            self.quizUserModel = quizUserModel
        }
        
        func onClickButton() {
            var listOfPreferredTopics:[String] = []
            for index in self.listOfSelections.indices {
                if self.listOfSelections[index].isChecked {
                    listOfPreferredTopics.append(self.listOfSelections[index].text)
                }
            }
            self.quizUserModel.insertListOfPreferredTopics(listOfPreferredTopics: listOfPreferredTopics)
            print(self.quizUserModel.learningArea)
            print(self.quizUserModel.learningTopic)
            print(self.quizUserModel.listOfPreferredTopics)
            print(self.quizUserModel.numberOfGroupMembers)
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

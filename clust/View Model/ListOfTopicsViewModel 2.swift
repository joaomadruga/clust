//
//  ListOfTopicsViewModel.swift
//  clust
//
//  Created by João Madruga on 25/03/23.
//

import SwiftUI

class ListOfTopicsViewModel: ObservableObject {
    var quizUserModel: QuizUserModel
    var topicsModel: TopicsModel
    
    init(searchText: Binding<String>, quizUserModel: QuizUserModel) {
        self.topicsModel = .init(searchText: searchText)
        self.quizUserModel = quizUserModel
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
    
    func selectCurrentOption(selectedTopic: String) {
        quizUserModel.insertLearningTopic(learningTopic: selectedTopic)
        print(self.quizUserModel.learningTopic)
        print(self.quizUserModel.learningArea)
        print(self.quizUserModel.numberOfGroupMembers)
    }
    
    
}

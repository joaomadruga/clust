//
//  QuizUserModel.swift
//  clust
//
//  Created by João Madruga on 22/03/23.
//

import Foundation

class QuizUserModel: ObservableObject {
    var numberOfGroupMembers: Int = 0
    var learningArea: String = ""
    var learningTopic: String = ""
    var listOfPreferredTopics: [String] = []
    
    func insertLearningArea(learningArea: String) {
        self.learningArea = learningArea
    }
    
    func insertLearningTopic(learningTopic: String) {
        self.learningTopic = learningTopic
    }
    
    func insertListOfPreferredTopics(listOfPreferredTopics: [String]) {
        self.listOfPreferredTopics = listOfPreferredTopics
    }
}

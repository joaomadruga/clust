//
//  QuizUserModel.swift
//  clust
//
//  Created by João Madruga on 22/03/23.
//

import Foundation

struct QuizUserModel: Hashable {
    var numberOfGroupMembers: Int = 0
    var learningArea: String = ""
    var learningTheme: String = ""
    let listOfPreferredThemes: [String] = []
    
    mutating func insertLearningArea(learningArea: String) {
        self.learningArea = learningArea
    }
}

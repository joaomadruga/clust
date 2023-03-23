//
//  QuizMembersNumberViewModel.swift
//  clust
//
//  Created by João Madruga on 22/03/23.
//

import Foundation

import Foundation

extension QuizMembersNumberView {
    class QuizMembersNumberViewModel: ObservableObject {
        @Published var QuizUserModel:QuizUserModel = .init()
        
        func onClickButton(numberOfGroupMembers: String) {
            let intNumberOfGroupMembers = Int(numberOfGroupMembers) ?? 0
            self.QuizUserModel.numberOfGroupMembers = intNumberOfGroupMembers
            print(self.QuizUserModel)
        }
    }
}

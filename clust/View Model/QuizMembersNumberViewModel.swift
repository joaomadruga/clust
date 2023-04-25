//
//  QuizMembersNumberViewModel.swift
//  clust
//
//  Created by João Madruga on 22/03/23.
//

import Foundation
import SwiftUI

extension QuizMembersNumberView {
    class QuizMembersNumberViewModel: ObservableObject {
        @ObservedObject var QuizUserModel: QuizUserModel
        
        init(QuizUserModel: QuizUserModel) {
            self.QuizUserModel = QuizUserModel
        }
        
        func onClickButton(numberOfGroupMembers: String) {
            let intNumberOfGroupMembers = Int(numberOfGroupMembers) ?? 0
            self.QuizUserModel.insertNumberOfGroupMembers(numberOfGroupMembers: intNumberOfGroupMembers)
        }
    }
}

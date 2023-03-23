//
//  ChooseAreaViewModel.swift
//  clust
//
//  Created by João Madruga on 22/03/23.
//

import Foundation

extension ChooseAreaView {
    class ChooseAreaViewModel: ObservableObject {
        @Published var QuizUserModel: QuizUserModel
        @Published var ListOfSelections: [OptionModel] = [.init(index: 0, text: "Desenvolvimento"), .init(index: 1, text: "Design"), .init(index: 2, text: "Inovação")]
        
        init(QuizUserModel: QuizUserModel) {
            self.QuizUserModel = QuizUserModel
        }
        
        func onClickButton() {
            var learningArea = ""
            for index in self.ListOfSelections.indices {
                if self.ListOfSelections[index].isChecked {
                    learningArea = self.ListOfSelections[index].text
                    break
                }
            }
            self.QuizUserModel.learningArea = learningArea
            print(self.QuizUserModel)
        }
    }
}

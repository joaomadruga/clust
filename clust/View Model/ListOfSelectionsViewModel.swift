//
//  ListOfSelectionViewModel.swift
//  clust
//
//  Created by João Madruga on 20/03/23.
//

import SwiftUI

extension ListOfSelectionsView {
    class ListOfSelectionsViewModel: ObservableObject {
        @Published var listOfSelectionsView: [OptionsModel]
        
        init(listOfSelectionsView: [OptionsModel]) {
            self.listOfSelectionsView = listOfSelectionsView
        }
        
        
        func insertSelectionView(optionIndex: Int, text: String, isChecked: Bool) -> Void {
            self.listOfSelectionsView.append(.init(index: optionIndex, text: text, isChecked: isChecked))
        }
        
        func cleanAllOptionsChecked() {
            //let teste = self.currentOptionsChecked.map({ $0.isChecked = false })
            for index in listOfSelectionsView.indices {
                listOfSelectionsView[index].isChecked = false
            }
            print(listOfSelectionsView)
        }
        
        func selectCurrentButton(index: Int) {
            listOfSelectionsView[index].isChecked = true
            print(listOfSelectionsView)
        }
    }
}

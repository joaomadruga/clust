//
//  ListOfSelectionViewModel.swift
//  clust
//
//  Created by João Madruga on 20/03/23.
//

import SwiftUI

extension ListOfSelectionsView {
    class ListOfSelectionsViewModel: ObservableObject {
        var listOfSelections: Binding<[OptionModel]>
        
        init(listOfSelections: Binding<[OptionModel]>) {
            self.listOfSelections = listOfSelections
        }
        
        
        func insertSelectionView(optionIndex: Int, text: String, isChecked: Bool) -> Void {
            listOfSelections.wrappedValue.append(.init(index: optionIndex, text: text, isChecked: isChecked))
        }
        
        func cleanAllOptionsChecked() {
            //let teste = self.currentOptionsChecked.map({ $0.isChecked = false })
            for index in listOfSelections.indices {
                listOfSelections[index].wrappedValue.isChecked = false
            }
        }
        
        func selectCurrentButton(index: Int) {
            listOfSelections[index].wrappedValue.isChecked = true
        }
    }
}

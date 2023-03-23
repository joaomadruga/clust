//
//  ProfileSelectorView.swift
//  clust
//
//  Created by João Madruga on 18/03/23.
//

import SwiftUI

struct ListOfSelectionsView: View {
    let globalStyle: GlobalStyle
    let listOfSelectionsView: [OptionsModel]
    
    @StateObject var viewModel = ListOfSelectionsViewModel(listOfSelectionsView: [])

    var body: some View {
        List(viewModel.listOfSelectionsView, id: \.self.hashValue) { option in
            Button(action: {
                viewModel.cleanAllOptionsChecked()
                viewModel.selectCurrentButton(index: option.index)
            }, label: {
                SelectionButtonView(globalStyle: globalStyle, isButtonChecked: option.isChecked, text: option.text)
            })
            .frame(maxWidth: .infinity, alignment: .leading)
            .listRowSeparator(.hidden)
        }
        .frame(maxWidth: .infinity)
        .background(.white)
        .scrollContentBackground(.hidden)
        
        .onAppear(perform: {
            viewModel.listOfSelectionsView = listOfSelectionsView
        })
        
        
    }

}

struct ListOfSelectionsView_Preview: PreviewProvider {
    static var previews: some View {
        ListOfSelectionsView(globalStyle: .init(), listOfSelectionsView: [.init(index: 0, text: "Desenvolvimento"), .init(index: 1, text: "Design"), .init(index: 2, text: "Inovação")])
    }
}

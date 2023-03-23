//
//  ProfileSelectorView.swift
//  clust
//
//  Created by João Madruga on 18/03/23.
//

import SwiftUI

struct ListOfSelectionsView: View {
    let globalStyle: GlobalStyle
    @ObservedObject var viewModel: ListOfSelectionsViewModel
    init(globalStyle: GlobalStyle, listOfSelections: Binding<[OptionModel]>) {
        self.globalStyle = globalStyle
        self.viewModel = ListOfSelectionsViewModel(listOfSelections: listOfSelections)
    }
    

    var body: some View {
        ScrollView {
            VStack{
                ForEach(viewModel.listOfSelections, id: \.self.hashValue) { option in
                    Button(action: {
                        viewModel.cleanAllOptionsChecked()
                        viewModel.selectCurrentButton(index: option.wrappedValue.index)
                    }, label: {
                        SelectionButtonView(globalStyle: globalStyle, isButtonChecked: option.wrappedValue.isChecked, text: option.wrappedValue.text)
                    })
                }
            }
        }
    }

}

struct ListOfSelectionsView_Preview: PreviewProvider {
    static var previews: some View {
        // Como fazer esse preview com binding?
        Text("não sei fazer esse preview :(")
    }
}

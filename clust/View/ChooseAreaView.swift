//
//  ChooseAreaView.swift
//  clust
//
//  Created by João Madruga on 20/03/23.
//

import SwiftUI

struct ChooseAreaView: View {
    let globalStyle: GlobalStyle
    @StateObject var viewModel: ChooseAreaViewModel
    
    init(globalStyle: GlobalStyle, QuizUserModel: QuizUserModel) {
        self.globalStyle = globalStyle
        _viewModel = StateObject(wrappedValue: ChooseAreaViewModel(QuizUserModel: QuizUserModel))
    }
    
    
    var body: some View {
        VStack {
            HeaderTitleView(text: "Em qual área de aprendizagem deseja focar neste desafio?")
            ListOfSelectionsView(globalStyle: globalStyle, listOfSelections: $viewModel.ListOfSelections)
            Spacer()
            MainButtonView(globalStyle: globalStyle, destinationScreen: Text("teste"), backButtonText: "Sair", buttonAction: {
                viewModel.onClickButton()
            })
        }
        .frame(maxWidth: .infinity)
    }
}

struct ChooseAreaView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseAreaView(globalStyle: .init(), QuizUserModel: .init()).allScreensStyle()
    }
}

//
//  ChooseTopThreeTopicsView.swift
//  clust
//
//  Created by João Madruga on 03/04/23.
//

import SwiftUI

struct ChooseTopThreeTopicsView: View {
    @ObservedObject var viewModel: ChooseTopThreeTopicsViewModel
    let globalStyle: GlobalStyle
    
    init(globalStyle: GlobalStyle, quizUserModel: QuizUserModel) {
        self.globalStyle = globalStyle
        self.viewModel = .init(quizUserModel: quizUserModel)
    }
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            HeaderTitleView(text: "Para finalizar... Veja os temas inseridos pela turma e selecione os seus 3 preferidos")
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(viewModel.listOfSelections, id: \.self) { option in
                        Button(action: {
                            viewModel.selectCurrentButton(index: option.index)
                        }, label: {
                            SelectionButtonView(globalStyle: globalStyle, isButtonChecked: option.isChecked, text: option.text)
                        })
                    }
                }
            }
            MainButtonView(globalStyle: globalStyle, destinationScreen: LoadingScreenView(globalStyle: globalStyle, text: "Tá bom de lero lero! As equipes já estão sendo formadas. 🏃", destinationScreen: ChooseTopThreeTopicsView(globalStyle: globalStyle, quizUserModel: viewModel.quizUserModel)), backButtonText: "Sair", buttonAction: { viewModel.onClickButton() }, buttonText: "Finalizar")
        }
    }
}

struct ChooseTopThreeTopicsView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseTopThreeTopicsView(globalStyle: .init(), quizUserModel: .init()).allScreensStyle()
    }
}

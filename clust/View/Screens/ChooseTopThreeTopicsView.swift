//
//  ChooseTopThreeTopicsView.swift
//  clust
//
//  Created by João Madruga on 03/04/23.
//

import SwiftUI
import Combine

struct ChooseTopThreeTopicsView: View {
    @StateObject var viewModel: ChooseTopThreeTopicsViewModel
    @ObservedObject var formGroupViewModel: FormGroupViewModel
    let globalStyle: GlobalStyle
    
    init(globalStyle: GlobalStyle, quizUserModel: QuizUserModel, formGroupViewModel: FormGroupViewModel, currentRoom: RoomModel) {
        self.globalStyle = globalStyle
        self.formGroupViewModel = formGroupViewModel
        _viewModel = StateObject(wrappedValue: ChooseTopThreeTopicsViewModel(quizUserModel: quizUserModel, formGroupViewModel: formGroupViewModel, currentRoom: currentRoom))
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
            MainButtonView(globalStyle: globalStyle, destinationScreen: LoadingScreenView(globalStyle: globalStyle, text: "Tá bom de lero lero! As equipes já estão sendo formadas. 🏃", destinationScreen: EmptyView(), formGroupViewModel: formGroupViewModel, currentRoom: viewModel.currentRoom, prevScreen: "ChooseTopThreeTopicsView"), backButtonText: "Sair", buttonAction: { viewModel.onClickButton() }, buttonText: "Finalizar")
        }
        .onAppear() {
            // this works properly
            print("mudei")
            viewModel.loadListOfSelections()
        }
    }
}

struct ChooseTopThreeTopicsView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseTopThreeTopicsView(globalStyle: .init(), quizUserModel: .init(peerID: .init()), formGroupViewModel: .init(), currentRoom: .init(roomOwner: .init(), defineArea: .init(), roomOwnerName: .init())).allScreensStyle()
    }
}

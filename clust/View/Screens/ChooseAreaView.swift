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
    var currentRoom: RoomModel
    @ObservedObject var formGroupViewModel: FormGroupViewModel
    
    init(globalStyle: GlobalStyle, quizUserModel: QuizUserModel, currentRoom: RoomModel, formGroupViewModel: FormGroupViewModel) {
        self.globalStyle = globalStyle
        _viewModel = StateObject(wrappedValue: ChooseAreaViewModel(QuizUserModel: quizUserModel))
        self.currentRoom = currentRoom
        self.formGroupViewModel = formGroupViewModel
    }
    
    
    var body: some View {
        VStack {
            HeaderTitleView(text: "Em qual área de aprendizagem deseja focar neste desafio?")
            ListOfSelectionsView(globalStyle: globalStyle, listOfSelections: $viewModel.ListOfSelections)
            Spacer()
            MainButtonView(globalStyle: globalStyle, destinationScreen: ChooseTopicView(globalStyle: globalStyle, QuizUserModel: viewModel.QuizUserModel, currentRoom: currentRoom, formGroupViewModel: formGroupViewModel), backButtonText: "Sair", buttonAction: {
                viewModel.onClickButton()
            })
        }
        .frame(maxWidth: .infinity)
        
    }
}

struct ChooseAreaView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseAreaView(globalStyle: .init(), quizUserModel: .init(peerID: .init()), currentRoom: .init(roomOwner: .init(), defineArea: .init(), roomOwnerName: .init()), formGroupViewModel: .init()).allScreensStyle()
    }
}

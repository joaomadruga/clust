//
//  QuizMembersNumberView.swift
//  clust
//
//  Created by João Madruga on 19/03/23.
//

import SwiftUI

struct QuizMembersNumberView: View {
    let globalStyle: GlobalStyle
    @State var membersNumber: String
    var viewModel: QuizMembersNumberViewModel
    var currentRoom: RoomModel
    @ObservedObject var formGroupViewModel: FormGroupViewModel
    @ObservedObject var quizUserModel: QuizUserModel
    
    
    init(globalStyle: GlobalStyle, quizUserModel: QuizUserModel, currentRoom: RoomModel, formGroupViewModel: FormGroupViewModel) {
        self.globalStyle = globalStyle
        self.membersNumber = ""
        self.viewModel = .init(QuizUserModel: quizUserModel)
        self.currentRoom = currentRoom
        self.formGroupViewModel = formGroupViewModel
        self.quizUserModel = quizUserModel
    }
    
    
    var body: some View {
        VStack {
            HeaderTitleView(text: "Quantos integrantes por equipe seria ideal nesse desafio?")
            TextField(
                "Pessoas por grupo",
                text: $membersNumber
            )
            .padding(14)
            .background(globalStyle.inputGrey)
            .cornerRadius(10)
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .keyboardType(.numberPad)
            
            Spacer()
            
            MainButtonView(globalStyle: globalStyle, destinationScreen: ChooseAreaView(globalStyle: globalStyle, quizUserModel: viewModel.QuizUserModel, currentRoom: currentRoom, formGroupViewModel: formGroupViewModel), backButtonText: "Sair", buttonAction: {
                viewModel.onClickButton(numberOfGroupMembers: membersNumber)
            })
        }
    }
    
}

struct QuizMembersNumberView_Previews: PreviewProvider {
    static var previews: some View {
        QuizMembersNumberView(globalStyle: .init(), quizUserModel: .init(peerID: .init()), currentRoom: .init(roomOwner: .init(), defineArea: .init(), roomOwnerName: .init()), formGroupViewModel: .init()).allScreensStyle()
    }
}


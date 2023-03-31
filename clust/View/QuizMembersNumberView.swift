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
    //@StateObject var QuizUserModel: QuizUserModel = .init()
    var viewModel: QuizMembersNumberViewModel
    
    
    init(globalStyle: GlobalStyle) {
        self.globalStyle = globalStyle
        self.membersNumber = ""
        self.viewModel = .init()
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
            
            MainButtonView(globalStyle: globalStyle, destinationScreen: ChooseAreaView(globalStyle: globalStyle, QuizUserModel: viewModel.QuizUserModel), backButtonText: "Sair", buttonAction: {
                viewModel.onClickButton(numberOfGroupMembers:  membersNumber)
            })
        }
    }
    
}

struct QuizMembersNumberView_Previews: PreviewProvider {
    static var previews: some View {
        QuizMembersNumberView(globalStyle: .init()).allScreensStyle()
    }
}


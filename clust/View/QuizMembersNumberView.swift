//
//  QuizMembersNumberView.swift
//  clust
//
//  Created by João Madruga on 19/03/23.
//

import SwiftUI

struct QuizMembersNumberView: View {
    let globalStyle: GlobalStyle
    @State private var username: String = ""
    
    func teste(){
        print("hello world")
    }
    var body: some View {
        NavigationView {
            VStack {
                HeaderTitleView(text: "Quantos integrantes por equipe seria ideal nesse desafio?")
                TextField(
                    "Pessoas por grupo",
                    text: $username
                )
                .padding(14)
                .background(globalStyle.inputGrey)
                .cornerRadius(10)
                .onSubmit {
                    print("hello world")
                }
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .keyboardType(.numberPad)
                
                Spacer()
                
                MainButtonView(globalStyle: globalStyle, destinationScreen: ChooseAreaView(globalStyle: globalStyle), buttonAction: teste)
            }
        }
    }
}

struct QuizMembersNumberView_Previews: PreviewProvider {
    static var previews: some View {
        QuizMembersNumberView(globalStyle: .init()).allScreensStyle()
    }
}


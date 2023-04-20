//
//  CreateChallengeView.swift
//  clust
//
//  Created by Gustavo Hollanda on 18/04/23.
//

import SwiftUI

struct CreateChallengeView: View {
    let globalStyle: GlobalStyle
    @State private var username: String = ""
    @State private var isToggle : Bool = false

    func teste(){
        print("hello world")
    }
    var body: some View {
        NavigationView {
            VStack {
                HeaderTitleView(text: "Criar nova sala de formação de equipes")
                Text("Ao iniciar uma sala de formação de equipes, todos os participantes que estão na mesma rede Wi-Fi poderão ingressar.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 22))
                    .foregroundColor(globalStyle.systemGrey3)
                    .padding(EdgeInsets(top: -16, leading: 0, bottom: 16, trailing: 0))
                TextField(
                    "Nome da Challenge",
                    text: $username
                )
                .padding(14)
                .font(.system(size: 22))
                .background(globalStyle.inputGrey)
                .cornerRadius(10)
                .onSubmit {
                    print("hello world")
                }
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .keyboardType(.numberPad)

                Text("Ex: Challenge Paris")
                    .padding(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(globalStyle.systemGrey2)
                    .padding(.bottom, 18)
                    .font(.system(size: 18))
                Toggle(isOn: $isToggle) {
                    Text("Os estudantes precisam definir sua área de atuação?")
                }
                .padding(16)
                .background(globalStyle.inputGrey)
                .foregroundColor(globalStyle.systemGrey1)
                .cornerRadius(10)
                .font(.system(size: 22))

                Text("Caso não seja necessário, os estudantes não serão categorizados entre desenvolvimento, design e inovação.")
                    .padding(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(globalStyle.systemGrey2)
                    .padding(.bottom, 18)
                Spacer()

                MainButtonView(globalStyle: globalStyle, destinationScreen: StartScreenView(globalStyle: globalStyle), backButtonText: "", buttonAction: teste)
            }
        }
    }
}
struct CreateChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        CreateChallengeView(globalStyle: .init()).allScreensStyle()
    }
}

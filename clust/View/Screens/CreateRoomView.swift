//
//  CreateChallengeView.swift
//  clust
//
//  Created by Gustavo Hollanda on 18/04/23.
//

import SwiftUI
import MultipeerConnectivity

struct CreateRoomView: View {
    let globalStyle: GlobalStyle
    let roomOwnerName: String
    
    @State private var challenge: String
    @State private var defineArea: Bool
    @State var viewModel: CreateRoomViewModel
    
    init(globalStyle: GlobalStyle, formGroupViewModel: FormGroupViewModel, roomOwnerName: String) {
        self.globalStyle = globalStyle
        self.challenge = ""
        self.defineArea = false
        self.roomOwnerName = roomOwnerName
        self.viewModel = .init(formGroupViewModel: formGroupViewModel)
    }
    
    var body: some View {
            VStack {
                HeaderTitleView(text: "Criar nova sala de formação de equipes")
                Text("Ao iniciar uma sala de formação de equipes, todos os participantes que estão na mesma rede Wi-Fi poderão ingressar.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.body)
                    .foregroundColor(globalStyle.systemGrey3)
                    .padding(EdgeInsets(top: -16, leading: 0, bottom: 16, trailing: 0))
                
                TextField("Nome do Challenge", text: $challenge)
                .padding(12)
                .background(globalStyle.inputGrey)
                .cornerRadius(12)

                Text("Ex: Challenge Paris")
                    .padding(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(globalStyle.systemGrey2)
                    .font(.caption)
                    .padding(.bottom, 16)
                
                Toggle(isOn: $defineArea) {
                    Text("Os estudantes precisam definir sua área de atuação?")
                }
                .padding(12)
                .background(globalStyle.inputGrey)
                .foregroundColor(globalStyle.systemGrey1)
                .cornerRadius(12)

                Text("Caso não seja necessário, os estudantes não serão categorizados entre desenvolvimento, design e inovação.")
                    .padding(.leading)
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(globalStyle.systemGrey2)
                
                Spacer()
                
                MainButtonView(globalStyle: globalStyle, destinationScreen: MentorWaitRoomView(globalStyle: globalStyle, createRoomViewModel: viewModel), backButtonText: "", buttonAction: {
                    viewModel.advertiseCreateRoom(roomName: challenge, defineArea: defineArea, roomOwnerName: roomOwnerName)
                })
                
                
            }
        
    }
}
struct CreateRoomView_Previews: PreviewProvider {
    static var previews: some View {
        CreateRoomView(globalStyle: .init(), formGroupViewModel: .init(), roomOwnerName: "Kiev").allScreensStyle()
    }
}

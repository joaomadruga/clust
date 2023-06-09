//
//  ChooseTopicView.swift
//  clust
//
//  Created by João Madruga on 25/03/23.
//

import SwiftUI

struct ChooseTopicView: View {
    let globalStyle: GlobalStyle
    var QuizUserModel: QuizUserModel
    @State private var searchText = ""
    var currentRoom: RoomModel
    @ObservedObject var formGroupViewModel: FormGroupViewModel
    
    var body: some View {
        VStack {
            HeaderTitleView(text: "Escolha um tema que você deseja explorar nesse desafio")
                .padding(0)
            NavigationView {
                ListOfTopicsView(searchText: $searchText, globalStyle: globalStyle, QuizUserModel: QuizUserModel, currentRoom: currentRoom, formGroupViewModel: formGroupViewModel)
            }
            .searchable(text: $searchText, prompt: "Pesquisar temas")
            //não me orgulho das próximas linhas
            .padding(.top, -30)
            .padding([.leading, .trailing], -20)
        }
    }
}

struct ChooseTopicView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseTopicView(globalStyle: .init(), QuizUserModel: .init(peerID: .init()), currentRoom: .init(roomOwner: .init(), defineArea: .init(), roomOwnerName: .init()), formGroupViewModel: .init()).allScreensStyle()
    }
}

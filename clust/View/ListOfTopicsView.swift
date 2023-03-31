//
//  ListOfTopicsView.swift
//  clust
//
//  Created by João Madruga on 25/03/23.
//

import SwiftUI

struct ListOfTopicsView: View {
    let globalStyle: GlobalStyle
    var searchText: Binding<String>
    var viewModel: ListOfTopicsViewModel
    @State private var showAlert = false
    
    init(searchText: Binding<String>, globalStyle: GlobalStyle, QuizUserModel: QuizUserModel) {
        self.globalStyle = globalStyle
        self.searchText = searchText
        self.viewModel = ListOfTopicsViewModel(searchText: self.searchText, quizUserModel: QuizUserModel)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Group {
                    if viewModel.topicsModel.searchText.wrappedValue.isEmpty {
                        FindTopicView(globalStyle: globalStyle, searchText: self.searchText)
                    }
                    else if !viewModel.topicsModel.searchText.wrappedValue.isEmpty && viewModel.searchResults.isEmpty {
                        VStack {
                            Text("Não encontramos nenhum resultado para '\(viewModel.topicsModel.searchText.wrappedValue)'. Deseja escolher como seu tema?").foregroundColor(globalStyle.systemGrey2)
                                .padding(.bottom, 16)
                            Button(action: {
                                showAlert = true
                            }) {
                                HStack {
                                    Text("Escolher \(viewModel.topicsModel.searchText.wrappedValue)")

                                    Image(systemName: "arrow.right")
                                }
                                    .padding([.top, .bottom], 12)
                                    .padding([.leading, .trailing], 24)
                                    .cornerRadius(14)
                                    .foregroundColor(.white)
                                    .background(globalStyle.mainGreen)
                            }
                            .cornerRadius(14)
                            .alert(isPresented: $showAlert) {
                                Alert(title: Text("Você deseja escolher \(viewModel.topicsModel.searchText.wrappedValue) como tema?"),
                                      message: Text("Esse será o tema apresentado aos demais estudantes para votação. Essa ação é irreversível."),
                                      primaryButton: .cancel(Text("Cancelar").fontWeight(.regular)),
                                      secondaryButton: .default(Text("Escolher").fontWeight(.bold), action: { print("hello") }))
                            }
                        } .padding(.top, 16)
                    }
                    else {
                        ForEach(viewModel.searchResults, id: \.self.hashValue) { optionName in
                            SelectionTopicView(optionName: optionName, globalStyle: globalStyle, buttonAction: viewModel.selectCurrentOption)
                                .padding(.top, 16)
                        }
                    }
                }
            }.listStyle(PlainListStyle())
        }
        .padding([.leading, .trailing], 20)
    }
}

struct ListOfTopicsView_Previews: PreviewProvider {
    static var previews: some View {
        ListOfTopicsView(searchText: .constant(""), globalStyle: .init(), QuizUserModel: .init())
    }
}

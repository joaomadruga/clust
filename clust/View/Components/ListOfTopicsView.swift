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
    @State var showLoadingScreenView: Bool = false
    
    init(searchText: Binding<String>, globalStyle: GlobalStyle, QuizUserModel: QuizUserModel) {
        self.globalStyle = globalStyle
        self.searchText = searchText
        self.viewModel = ListOfTopicsViewModel(searchText: self.searchText, quizUserModel: QuizUserModel)
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                        // When input is clean, show search options
                        if viewModel.topicsModel.searchText.wrappedValue.isEmpty {
                            FindTopicView(globalStyle: globalStyle, searchText: self.searchText)
                        }
                        // When input is not clean and didnt find anything, show option to add
                        else if !viewModel.topicsModel.searchText.wrappedValue.isEmpty && viewModel.searchResults.isEmpty {
                            VStack {
                                Text("Não encontramos nenhum resultado para '\(viewModel.topicsModel.searchText.wrappedValue)'. Deseja escolher como seu tema?")
                                    .foregroundColor(globalStyle.systemGrey2)
                                    .padding(.bottom, 16)
                                Button(action: { showAlert = true }) {
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
                                          secondaryButton: .default( Text("Escolher").fontWeight(.bold), action: { viewModel.selectCurrentOption(showLoadingScreenView: $showLoadingScreenView) }))
                                }
                            }.padding(.top, 16)
                        }
                        //Show option finded
                        else {
                            ForEach(viewModel.searchResults, id: \.self.hashValue) { optionName in
                                SelectionTopicView(optionName: optionName, globalStyle: globalStyle, showLoadingScreenView: $showLoadingScreenView, buttonAction: viewModel.selectCurrentOption)
                                    .padding(.top, 16)
                            }
                        }
                    
                }
                .listStyle(PlainListStyle())
            }
            .padding([.leading, .trailing], 20)
        }
        .navigationDestination(isPresented: $showLoadingScreenView) {
            LoadingScreenView(globalStyle: globalStyle, text: "Por favor, aguarde todos resolverem suas crises existenciais enquanto pensam no tema. 🫂💭", destinationScreen: ChooseTopThreeTopicsView(globalStyle: globalStyle, quizUserModel: viewModel.quizUserModel)).allScreensStyle()
        }
    }
}

struct ListOfTopicsView_Previews: PreviewProvider {
    static var previews: some View {
        ListOfTopicsView(searchText: .constant(""), globalStyle: .init(), QuizUserModel: .init())
    }
}

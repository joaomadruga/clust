//
//  CreateProfileView.swift
//  clust
//
//  Created by João Madruga on 01/04/23.
//

import SwiftUI

struct CreateProfileView: View {
    private enum Field: Int, CaseIterable {
        case memoji, name, email
    }
    
    @State var memojiText: String
    @State var imageBase64String: String?
    @State var currentCheckedColor: CurrentCheckedColorModel
    @State var nameInputText: String
    @State var emailInputText: String
    @FocusState private var inputActive: Field?
    let globalStyle: GlobalStyle
    
    init(imageBase64String: String? = nil, globalStyle: GlobalStyle) {
        self.memojiText = ""
        self.imageBase64String = imageBase64String
        self.globalStyle = globalStyle
        self.currentCheckedColor = CurrentCheckedColorModel()
        self.nameInputText = ""
        self.emailInputText = ""
    }
    
    @StateObject private var viewModel = CreateProfileViewModel()
    
    var body: some View {
            VStack {
                        HeaderTitleView(text: "Crie seu perfil")
                        MemojiInputView(memojiText: $memojiText, imageBase64String: $imageBase64String, backgroundColor: $currentCheckedColor.color)
                            .frame(alignment: .center)
                            .frame(width: 150, height: 150)
                            .padding(.bottom, 16)
                            .focused($inputActive, equals: .memoji)
                
                        HStack(spacing: 15) {
                            ForEach(Array(currentCheckedColor.listOfColors.enumerated()), id: \.offset) { index, color in
                                ProfileColorButtonView(globalStyle: globalStyle, color: color, buttonAction: {
                                    currentCheckedColor.color = currentCheckedColor.listOfColors[index]
                                    currentCheckedColor.index = index
                                }, isButtonChecked: currentCheckedColor.index == index)
                            }
                        }
                        .padding(.bottom, 20)
                        
                        VStack (spacing: 0) {
                            TextField(
                                "Nome",
                                text: $nameInputText
                            )
                            .padding(14)
                            .background(globalStyle.inputGrey)
                            .disableAutocorrection(true)
                            .focused($inputActive, equals: .name)
                            
                            Divider()
                            
                            TextField(
                                "Email",
                                text: $emailInputText
                            )
                            .padding(14)
                            .background(globalStyle.inputGrey)
                            .disableAutocorrection(true)
                            .focused($inputActive, equals: .email)
                            
                        }
                        .cornerRadius(10)
                        .padding(.bottom, 20)
                        
                        Spacer()
                
                        MainButtonView(globalStyle: globalStyle, destinationScreen: { ProfileSelectorView(loginModel: viewModel.LoginModel, globalStyle: globalStyle) }(), backButtonText: "Voltar", buttonAction: {
                            viewModel.onClickButton(name: nameInputText, email: emailInputText, profileImage: imageBase64String, profileImageBackground: currentCheckedColor)
                        }, buttonText: "Criar perfil")
            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()

                    Button("OK", action: {
                        inputActive = nil
                    })
                }
            }
        
                
           
    }
}


struct CreateProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfileView(globalStyle: .init()).allScreensStyle()
    }
}

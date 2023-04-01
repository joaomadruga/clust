//
//  CreateProfileView.swift
//  clust
//
//  Created by João Madruga on 01/04/23.
//

import SwiftUI

struct CreateProfileView: View {
    @State var memojiText: String
    @State var imageBase64String: String?
    @State private var image: UIImage?
    @State var currentCheckedColor: CurrentCheckedColorModel
    @State var nameInputText: String
    @State var emailInputText: String
    let globalStyle: GlobalStyle
    
    init(imageBase64String: String? = nil, image: UIImage? = nil, globalStyle: GlobalStyle) {
        self.memojiText = ""
        self.imageBase64String = imageBase64String
        self.image = image
        self.globalStyle = globalStyle
        self.currentCheckedColor = CurrentCheckedColorModel()
        self.nameInputText = ""
        self.emailInputText = ""
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 20) {
                    HeaderTitleView(text: "Crie seu perfil")
                    MemojiInputView(memojiText: $memojiText, imageBase64String: $imageBase64String, backgroundColor: $currentCheckedColor.color)
                        .frame(alignment: .center)
                        .frame(width: 150, height: 150)
                    HStack(spacing: 15) {
                        ForEach(Array(currentCheckedColor.listOfColors.enumerated()), id: \.offset) { index, color in
                            ProfileColorButtonView(globalStyle: globalStyle, color: color, buttonAction: {
                                currentCheckedColor.color = currentCheckedColor.listOfColors[index]
                                currentCheckedColor.index = index
                            }, isButtonChecked: currentCheckedColor.index == index)
                        }
                    }
                    
                    Form {
                        TextField(text: $nameInputText, label: { Text("Nome").foregroundColor(globalStyle.systemGrey2) })
                            .listRowBackground(globalStyle.inputGrey)
                        TextField(text: $emailInputText, label: { Text("Email").foregroundColor(globalStyle.systemGrey2) })
                            .listRowBackground(globalStyle.inputGrey)
                    }
                    .padding(-10)
                    .scrollDisabled(true)
                    .scrollContentBackground(.hidden)
                    
                    Spacer()
                    
                    MainButtonView(globalStyle: globalStyle, destinationScreen: { Text("teste") }(), backButtonText: "Voltar", buttonAction: {
                        print("hello world")
                    }, buttonText: "Criar perfil")
                }
                .frame(width: geometry.size.width , height: geometry.size.height)
            }
        }
    }
}

struct CreateProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfileView(globalStyle: .init()).allScreensStyle()
    }
}

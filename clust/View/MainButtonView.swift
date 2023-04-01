//
//  MainButtonView.swift
//  clust
//
//  Created by João Madruga on 18/03/23.
//

import SwiftUI

struct MainButtonView: View {
    let globalStyle: GlobalStyle
    let destinationScreen: any View
    let backButtonText: String
    let buttonAction: () -> Void
    var buttonText: String
    
    init(globalStyle: GlobalStyle, destinationScreen: any View, backButtonText: String, buttonAction: @escaping () -> Void, buttonText: String = "Continuar") {
        self.globalStyle = globalStyle
        self.destinationScreen = destinationScreen
        self.backButtonText = backButtonText
        self.buttonAction = buttonAction
        self.buttonText = buttonText
    }
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationLink(destination: AnyView(destinationScreen).allScreensStyle()) {
                Text(buttonText)
                    .frame(maxWidth: .infinity)
                    .padding(14)
                    .fontWeight(.bold)
                    .cornerRadius(14)
                    .foregroundColor(.white)
                    .background(globalStyle.mainGreen)
                    
        }.simultaneousGesture(TapGesture().onEnded{
            buttonAction()
        })
            .cornerRadius(14)
    }
        
}

struct MainButtonView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainButtonView(globalStyle: .init(), destinationScreen: QuizMembersNumberView(globalStyle: .init()), backButtonText: "Voltar", buttonAction: { print("hello world") }).allScreensStyle()
    }
}

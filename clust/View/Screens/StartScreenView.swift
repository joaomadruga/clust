//
//  StartScreenView.swift
//  clust
//
//  Created by João Madruga on 16/03/23.
//

import SwiftUI
import AuthenticationServices

struct StartScreenView: View {
    let globalStyle: GlobalStyle
    let loginModel: LoginModel
    
    var body: some View {
        VStack {
            Spacer()
            Image("GroupClust")
            Spacer()
            
            MainButtonView(globalStyle: globalStyle, destinationScreen: ProfileSelectorView(loginModel: loginModel, globalStyle: globalStyle), backButtonText: "Voltar", buttonAction: {}, buttonText: "Criar conta")
        }.navigationBarBackButtonHidden(true)
    }
}

struct StartScreenView_Previews: PreviewProvider {
    static var previews: some View {
        StartScreenView(globalStyle: .init(), loginModel: .init()).allScreensStyle()
    }
}

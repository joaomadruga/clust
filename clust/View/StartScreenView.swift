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
    // It's mocked since i did not discovered how to enable apple sign in auth in simulator.
    let UserLoginInfo:LoginInfo = .init(name: "José", email: "zezinho@teste.com")
    
    
    var body: some View {
            VStack {
                Spacer()
                Image("GroupClust")
                Spacer()
                
                NavigationLink(destination: ProfileSelectorView(loginInfo: UserLoginInfo, globalStyle: globalStyle).allScreensStyle()) {
                    SignInWithAppleButton(
                            .signIn,
                            onRequest: { request in
                                request.requestedScopes = [.fullName, .email]
                            },
                            onCompletion: { result in
                                switch result {
                                    case .success (let authValues):
                                        print(authValues)
                                        print("Authorization successful.")
                                        //UserLoginInfo.name = request.requestedScopes.fullName
                                        //UserLoginInfo.email = request.requestedScopes.email
                                    case .failure (let error):
                                        print("Authorization failed: " + error.localizedDescription)
                                    }
                            }
                        )
                        .frame(height: 50)
                        .signInWithAppleButtonStyle(.black)
                        .frame(maxWidth: .infinity)
                }
        }
    }
    
}

struct StartScreenView_Previews: PreviewProvider {
    static var previews: some View {
        StartScreenView(globalStyle: .init()).allScreensStyle()
    }
}

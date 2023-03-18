//
//  StartScreenView.swift
//  clust
//
//  Created by João Madruga on 16/03/23.
//

import SwiftUI
import AuthenticationServices

struct StartScreenView: View {
    let UserLoginInfo:LoginInfo = .init(name: "José", email: "zezinho@teste.com")
    
    var body: some View {
            VStack {
                Spacer()
                Image("GroupClust")
                Spacer()
                
                NavigationLink(value: UserLoginInfo) {
                    SignInWithAppleButton(onRequest: {_ in }, onCompletion: {_ in })
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .signInWithAppleButtonStyle(.black)
                    
                }
                .navigationDestination(for: LoginInfo.self) { logininfo in
                    VStack{
                        Text(logininfo.name)
                        Text(logininfo.email)
                    }
                }
        }
    }
    
}

struct StartScreenView_Previews: PreviewProvider {
    static var previews: some View {
        StartScreenView()
    }
}

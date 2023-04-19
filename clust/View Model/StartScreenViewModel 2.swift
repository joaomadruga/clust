//
//  NavigateToViewModel.swift
//  clust
//
//  Created by João Madruga on 18/03/23.
//

import Foundation

extension StartScreenView {
    class StartScreenViewModel: ObservableObject {
        // It's mocked since i did not discovered how to enable apple sign in auth in simulator.
        @Published var UserLoginInfo:LoginInfo = .init(name: "José", email: "zezinho@teste.com")
        
        func setUserLoginInfo() -> Bool {
            //use it later
            return true
        }
    }
}

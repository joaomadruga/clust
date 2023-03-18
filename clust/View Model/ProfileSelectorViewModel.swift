//
//  NavigateToViewModel.swift
//  clust
//
//  Created by João Madruga on 18/03/23.
//

import Foundation

extension ProfileSelectorView {
    class ProfileSelectorViewModel: ObservableObject {
        // It's mocked since i did not discovered how to enable apple sign in auth in simulator.
        @Published var isStudentButtonChecked:Bool = true
        
        func createUserModel(loginInfo: LoginInfo) -> UserModel {
            let userModel:UserModel = .init(loginInfo: loginInfo, isStudent: self.isStudentButtonChecked)
            return userModel
        }
    }
}
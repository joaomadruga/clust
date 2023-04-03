//
//  QuizMembersNumberViewModel.swift
//  clust
//
//  Created by João Madruga on 22/03/23.
//

import Foundation
import SwiftUI

extension CreateProfileView {
    class CreateProfileViewModel: ObservableObject {
        @ObservedObject var LoginModel:LoginModel = .init()
        
        func onClickButton(name: String, email: String, profileImage: String?, profileImageBackground: CurrentCheckedColorModel) {
            self.LoginModel.name = name
            self.LoginModel.email = email
            self.LoginModel.profileImage = profileImage
            self.LoginModel.profileImageBackground = profileImageBackground
            print(self.LoginModel.name)
        }
    }
}

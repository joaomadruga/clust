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
        @ObservedObject var loginModel:LoginModel
        
        init(LoginModel: LoginModel) {
            self.loginModel = LoginModel
        }
        
        func onClickButton(name: String, email: String, profileImage: String?, profileImageBackgroundIndex: Int) {
            self.loginModel.name = name
            self.loginModel.email = email
            self.loginModel.profileImage = profileImage!
            self.loginModel.profileImageBackgroundIndex = profileImageBackgroundIndex
            self.loginModel.isLogged = true
            save()
        }
        
        private func fileURL() throws -> URL {
            try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent("loginModel.data")
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(loginModel)
                let outfile = try fileURL()
                try data.write(to: outfile)
            } catch {
                print(error)
            }
        }
    }
}

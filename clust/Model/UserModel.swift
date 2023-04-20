//
//  CheckedButton.swift
//  clust
//
//  Created by João Madruga on 18/03/23.
//

import Foundation

class UserModel {
    let loginModel: LoginModel
    let isStudent: Bool
    
    init(loginModel: LoginModel, isStudent: Bool) {
        self.loginModel = loginModel
        self.isStudent = isStudent
    }
    
}

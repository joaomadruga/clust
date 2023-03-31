//
//  CheckedButton.swift
//  clust
//
//  Created by João Madruga on 18/03/23.
//

import Foundation

class UserModel {
    let loginInfo: LoginInfo
    let isStudent: Bool
    
    init(loginInfo: LoginInfo, isStudent: Bool) {
        self.loginInfo = loginInfo
        self.isStudent = isStudent
    }
    
}

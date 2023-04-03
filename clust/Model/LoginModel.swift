//
//  LoginModel.swift
//  clust
//
//  Created by João Madruga on 17/03/23.
//

import Foundation

class LoginModel: ObservableObject {
    var name: String = ""
    var email: String = ""
    var profileImage: String? = nil
    var profileImageBackground: CurrentCheckedColorModel = .init()
}

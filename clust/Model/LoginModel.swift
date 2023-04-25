//
//  LoginModel.swift
//  clust
//
//  Created by João Madruga on 17/03/23.
//

import Foundation

class LoginModel: ObservableObject, Codable {
    var id: UUID = UUID()
    var name: String = ""
    var email: String = ""
    var profileImage: String = ""
    var profileImageBackgroundIndex: Int = 0
    var isLogged: Bool = false
    var isStudent = true
}

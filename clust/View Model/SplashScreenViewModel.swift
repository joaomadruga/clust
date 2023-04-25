//
//  SplashScreenViewModel.swift
//  clust
//
//  Created by João Madruga on 21/04/23.
//

import SwiftUI

extension SplashScreenView {
    class SplashScreenViewModel: ObservableObject {
        @Published var loginModel:LoginModel = .init()
        
        init() {
            loginModel = load()
        }
        
        private func fileURL() throws -> URL {
            try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent("loginModel.data")
        }
        
        func load() -> LoginModel {
            do {
                let fileURL = try fileURL()
                let file = try FileHandle(forReadingFrom: fileURL)
                let loginModel = try JSONDecoder().decode(LoginModel.self, from: file.availableData)
                return loginModel
            } catch {
                print(error)
            }
            
            return .init()
        }
    }
}

//
//  ProfileSelectorView.swift
//  clust
//
//  Created by João Madruga on 18/03/23.
//

import SwiftUI

struct ProfileSelectorView: View {
    let loginModel: LoginModel
    let globalStyle: GlobalStyle
    
    @StateObject private var viewModel = ProfileSelectorViewModel()
    
    var body: some View {
        VStack {
            HeaderTitleView(text: "Você é estudante ou mentora?")
           
            Button(action: {
                viewModel.isStudentButtonChecked = true
            }, label: {
                ButtonUserTypeView(globalStyle: globalStyle, isStudentButton: true, isButtonChecked: viewModel.isStudentButtonChecked)
            })
            
            Button(action: {
                viewModel.isStudentButtonChecked = false
            }, label: {
                ButtonUserTypeView(globalStyle: globalStyle, isStudentButton: false, isButtonChecked: !viewModel.isStudentButtonChecked)
            })

            Spacer()
            MainButtonView(globalStyle: globalStyle, destinationScreen: QuizMembersNumberView(globalStyle: globalStyle), backButtonText: "Sair", buttonAction: {
                let userModel = viewModel.createUserModel(loginModel: loginModel)
                print(userModel)
            })
            
        }
    }

}

struct ProfileSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSelectorView(loginModel: .init(), globalStyle: .init()).allScreensStyle()
    }
}

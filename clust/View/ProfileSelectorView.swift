//
//  ProfileSelectorView.swift
//  clust
//
//  Created by João Madruga on 18/03/23.
//

import SwiftUI

struct ProfileSelectorView: View {
    let loginInfo: LoginInfo
    let globalStyle: GlobalStyle
    
    @StateObject private var viewModel = ProfileSelectorViewModel()
    
    var body: some View {
        VStack {
            Text("Você é estudante ou mentora?")
                .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.largeTitle)
                    .foregroundColor(Color(UIColor.label))
                    .fontWeight(.bold)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0))
            
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
            
            Button(action: {
                let userModel = viewModel.createUserModel(loginInfo: loginInfo)
                print(userModel)
            }, label: {
                Text("Continuar")
                    .frame(maxWidth: .infinity)
                    .padding(10)
            })
            .buttonStyle(.borderedProminent)
            .tint(globalStyle.mainGreen)
            .foregroundColor(.white)
        }
    }

}

struct ProfileSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSelectorView(loginInfo: .init(name: "Maria", email: "zezinho@teste.com"), globalStyle: .init()).allScreensStyle()
    }
}

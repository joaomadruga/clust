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
    
    @State private var isStudentButtonChecked:Bool = true
    
    var body: some View {
        VStack {
            Text("Você é estudante ou mentora?")
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(maxWidth: .infinity)
                    .font(.largeTitle)
                    .foregroundColor(Color(UIColor.label))
                    .fontWeight(.bold)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0))
            
            Button(action: {
                self.isStudentButtonChecked = true
            }, label: {
                ButtonUserTypeView(globalStyle: globalStyle, isStudentButton: true, isButtonChecked: isStudentButtonChecked)
            }).contentShape(Rectangle())
            Button(action: {
                self.isStudentButtonChecked = false
            }, label: {
                ButtonUserTypeView(globalStyle: globalStyle, isStudentButton: false, isButtonChecked: !isStudentButtonChecked)
            })

            Spacer()
            
            Button(action: {
                let userModel:UserModel = .init(loginInfo: loginInfo, isStudent: isStudentButtonChecked)
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

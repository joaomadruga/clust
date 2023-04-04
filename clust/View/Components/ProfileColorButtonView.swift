//
//  ProfileColorButtonView.swift
//  clust
//
//  Created by João Madruga on 01/04/23.
//

import SwiftUI

struct ProfileColorButtonView: View {
    let globalStyle: GlobalStyle
    let color: LinearGradient
    let buttonAction: () -> Void
    var isButtonChecked: Bool
    
    var body: some View {
        Button(action: {
            buttonAction()
        }, label: {
            Text("")
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(50)
                .overlay(
                    Circle()
                        .strokeBorder(globalStyle.mainGreen, lineWidth: isButtonChecked ? 4 : 0)
                )
        })
            
    }
}

struct ProfileColorButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileColorButtonView(globalStyle: .init(), color: GlobalStyle().linearPurple, buttonAction: {print("hello world")}, isButtonChecked: true)
    }
}

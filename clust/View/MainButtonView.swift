//
//  MainButtonView.swift
//  clust
//
//  Created by João Madruga on 18/03/23.
//

import SwiftUI

struct MainButtonView: View {
    let globalStyle: GlobalStyle
    let destinationScreen: any View
    let buttonAction: () -> Void
    var buttonText: String = "Continuar"
    
    var body: some View {
        Button(action: {
            buttonAction()
        }, label: {
            NavigationLink(destination: AnyView(destinationScreen).allScreensStyle()) {
                Text(buttonText)
                    .frame(maxWidth: .infinity)
                    .padding(10)
            }
        })
        .buttonStyle(.borderedProminent)
        .tint(globalStyle.mainGreen)
        .foregroundColor(.white)
    }
    
    
}

struct MainButtonView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainButtonView(globalStyle: .init(), destinationScreen: QuizMembersNumberView(globalStyle: .init()), buttonAction: { print("hello world") }).allScreensStyle()
    }
}

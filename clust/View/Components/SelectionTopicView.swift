//
//  SelectionTopicView.swift
//  clust
//
//  Created by João Madruga on 25/03/23.
//

import SwiftUI

struct SelectionTopicView: View {
    let optionName: String
    let globalStyle: GlobalStyle
    var showLoadingScreenView: Binding<Bool>
    let buttonAction: (Binding<Bool>) -> Void
    var body: some View {
        VStack {
            HStack {
                Text(optionName)
                    .foregroundColor(.black)
                Spacer()
                Button(action: {
                    buttonAction(showLoadingScreenView)
                }, label: {
                    LightGreenButtonView(globalStyle: globalStyle, text: "Escolher")
                })
            }
            Divider()
        }
    }
}

struct SelectionTopicView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionTopicView(optionName: "Acessibilidade", globalStyle: .init(), showLoadingScreenView: .constant(false), buttonAction: { _  in print("teste") })
    }
}

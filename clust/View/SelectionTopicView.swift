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
    let buttonAction: (String) -> Void
    var body: some View {
        VStack {
            HStack {
                Text(optionName)
                    .foregroundColor(.black)
                Spacer()
                Button(action: {
                    buttonAction(optionName)
                }, label: {
                    HStack {
                        Text("Escolher")
                        Image(systemName: "arrow.right")
                    }
                        .foregroundColor(globalStyle.mainGreen)
                        .fontWeight(.medium)
                        .padding([.leading, .trailing], 10)
                        .padding([.top,. bottom], 8)
                        
                })
                .background(globalStyle.lightGreen)
                .cornerRadius(24)
                

            }
            Divider()
        }
    }
}

struct SelectionTopicView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionTopicView(optionName: "Acessibilidade", globalStyle: .init(), buttonAction: { _ in print("teste") })
    }
}

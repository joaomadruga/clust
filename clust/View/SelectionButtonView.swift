//
//  SelectionButtonView.swift
//  clust
//
//  Created by João Madruga on 20/03/23.
//

import SwiftUI

struct SelectionButtonView: View {
    let globalStyle: GlobalStyle
    let isButtonChecked: Bool
    let text: String
    var body: some View {
        Text(text)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.headline)
            .padding([.bottom, .top], 24)
            .padding([.leading, .trailing], 16)
            .foregroundColor(isButtonChecked ? globalStyle.mainGreen : globalStyle.systemGrey1)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(isButtonChecked ? globalStyle.mainGreen : globalStyle.systemGrey5, lineWidth: 4)
            )
            .background(isButtonChecked ? globalStyle.lightGreen : .white)
            .cornerRadius(16)
    }
}

struct SelectionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        HStack(spacing: 10) {
            SelectionButtonView(globalStyle: .init(), isButtonChecked: true, text: "Design")
            SelectionButtonView(globalStyle: .init(), isButtonChecked: false, text: "Desenvolvimento")
        }
    }
}

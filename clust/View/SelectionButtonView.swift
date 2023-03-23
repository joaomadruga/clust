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
        HStack {
            Text(text)
                .padding([.leading], 12)
                .padding([.top], 36)
            Spacer()
            if isButtonChecked {
                Image(systemName: "checkmark.circle.fill")
                    .frame(alignment: .top)
                    .padding([.trailing], 12)
                    .padding([.bottom], 36)
            }
        }
        .frame(maxWidth: .infinity)
        .font(.headline)
        .padding([.top, .bottom], 12)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(isButtonChecked ? globalStyle.mainGreen : globalStyle.systemGrey5, lineWidth: 4)
        )
        .foregroundColor(isButtonChecked ? .white : globalStyle.systemGrey1)
        .background(isButtonChecked ? globalStyle.mainGreen : .white)
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

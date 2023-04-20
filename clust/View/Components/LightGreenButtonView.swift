//
//  LightGreenButtonView.swift
//  clust
//
//  Created by João Madruga on 03/04/23.
//

import SwiftUI

struct LightGreenButtonView: View {
    let globalStyle: GlobalStyle
    let text: String
    var body: some View {
        Group {
            HStack {
                Text(text)
                Image(systemName: "arrow.right")
            }
            .foregroundColor(globalStyle.mainGreen)
            .fontWeight(.medium)
            .padding([.leading, .trailing], 10)
            .padding([.top,. bottom], 8)
        }
        .background(globalStyle.lightGreen)
        .cornerRadius(24)
    }
}

struct LightGreenButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LightGreenButtonView(globalStyle: .init(), text: "Escolher")
    }
}

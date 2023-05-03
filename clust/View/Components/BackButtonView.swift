//
//  BackButtonView.swift
//  clust
//
//  Created by João Madruga on 22/03/23.
//

import SwiftUI

struct BackButtonView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let text: String
    let foregroundColor: Color = GlobalStyle().mainGreen
    
    var body: some View {
        Button(action: { presentationMode.wrappedValue.dismiss()}) {
            HStack {
                Image(systemName: "chevron.left")
                    .foregroundColor(foregroundColor)
                    .aspectRatio(contentMode: .fit)
                Text(text)
                    .foregroundColor(foregroundColor)
            }
        }
    }
}

struct BackButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BackButtonView(text: "Voltar")
    }
}

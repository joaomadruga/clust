//
//  IndividualMemberView.swift
//  clust
//
//  Created by José Cordeiro on 24/04/23.
//

import SwiftUI

struct IndividualMemberView: View {
    let globalStyle: GlobalStyle
    let userName: String //= "Name"
    let userDescription: String = "Quer focar em Design e tem interesse em explorar WatchOS, AI e Gestures"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Circle().frame(width: 48) //replace for rounded memoji
            Text(userName).fontWeight(.medium)
            Text(userDescription).foregroundColor(globalStyle.systemGrey2).font(.footnote)
            Spacer()
        }
        .padding(24)
        .frame(width: 180, height: 240)
        .background(globalStyle.systemGrey6)
        .cornerRadius(24)
    }
}

struct IndividualMemberView_Previews: PreviewProvider {
    static var previews: some View {
        IndividualMemberView(globalStyle: .init(), userName: "Teste")
    }
}

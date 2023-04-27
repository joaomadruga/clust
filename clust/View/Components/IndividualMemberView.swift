//
//  IndividualMemberView.swift
//  clust
//
//  Created by José Cordeiro on 24/04/23.
//

import SwiftUI

struct IndividualMemberView: View {
    let globalStyle: GlobalStyle
    let memberModel: QuizUserModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            RoundedMemojiView(base64String: memberModel.memoji, backgroundIndex: Int.random(in: 0..<7), width: 48, height: 48)
            Text(memberModel.name).fontWeight(.medium)
            Text("Quer focar em \(memberModel.learningArea) e tem interesse em explorar \(memberModel.listOfPreferredTopics[0]), \(memberModel.listOfPreferredTopics[1]) e \(memberModel.listOfPreferredTopics[2])").foregroundColor(globalStyle.systemGrey2).font(.footnote)
            Spacer()
        }
        .padding(16)
        .frame(width: 180, height: 210)
        .background(globalStyle.systemGrey6)
        .cornerRadius(24)
    }
}

struct IndividualMemberView_Previews: PreviewProvider {
    static var previews: some View {
        IndividualMemberView(globalStyle: .init(), memberModel: .init(peerID: .init()))
    }
}

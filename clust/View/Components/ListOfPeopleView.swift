//
//  ListOfPeopleView.swift
//  clust
//
//  Created by Gustavo Hollanda on 21/03/23.
//

import SwiftUI

struct ListOfPeopleView: View {
    let globalStyle: GlobalStyle
    let username: String
    let description: String
    let memoji: String
    
    var body: some View {
            HStack(spacing: 16) {
                RoundedMemojiView(base64String: memoji, backgroundIndex: Int.random(in: 0..<7), width: 90, height: 90)
                VStack(alignment: .leading, spacing: 6) {
                    Text(username)
                        .font(
                            .system(size: 20)
                            .weight(.medium)
                        )
                    Text(description)
                        .foregroundColor(globalStyle.systemGrey2)
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 16)
    }
}

struct ListOfPeopleView_Previews: PreviewProvider {
    static var previews: some View {
        ListOfPeopleView(globalStyle: .init(), username: "joao", description: "teste description", memoji: "").allScreensStyle()
    }
}

//
//  ListOfMembersScreenView.swift
//  clust
//
//  Created by Gustavo Hollanda on 23/03/23.
//

import SwiftUI

struct ListOfMembersView: View {
    let globalStyle: GlobalStyle
    let currentGroup: GroupModel
    
    var body: some View {
        ScrollView {
            VStack {
                BackButtonView(text: "Voltar")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 10)
                HeaderTitleView(text: "Integrantes")
                ForEach(currentGroup.members, id: \.self.hashValue) { member in
                    ListOfPeopleView(globalStyle: globalStyle, username: member.name, description: "Quer focar em \(member.learningArea) e tem interesse em explorar \(member.listOfPreferredTopics[0]), \(member.listOfPreferredTopics[1]) e \(member.listOfPreferredTopics[2]).", memoji: member.memoji)
                }
            }
        }
    }
}

struct ListOfMembersView_Previews: PreviewProvider {
    static var previews: some View {
        ListOfMembersView(globalStyle: .init(), currentGroup: .init(members: .init())).allScreensStyle()
    }
}

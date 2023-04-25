//
//  GroupMembersView.swift
//  clust
//
//  Created by José Cordeiro on 24/04/23.
//

import SwiftUI

struct GroupMembersView: View {
    let globalStyle: GlobalStyle
    let groupName: String
    let group: GroupModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(groupName)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(group.members, id: \.self.hashValue) { member in
                        IndividualMemberView(globalStyle: .init(), userName: member.name)
                        .padding(.bottom, 16)}
                }
            }
        }
        .onAppear() {
            print(group.members)
        }
    }
}


struct GroupMembersView_Previews: PreviewProvider {
    static var previews: some View {
        GroupMembersView(globalStyle: .init(), groupName: .init(), group: .init(members: .init()))
    }
}

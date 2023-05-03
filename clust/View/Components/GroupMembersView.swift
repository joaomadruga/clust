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
                .font(.callout)
                .foregroundColor(globalStyle.systemGrey2)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(group.members, id: \.self.hashValue) { member in
                        IndividualMemberView(globalStyle: .init(), memberModel: member)
                        .padding(.bottom, 16)}
                }
            }
        }
    }
}


struct GroupMembersView_Previews: PreviewProvider {
    static var previews: some View {
        GroupMembersView(globalStyle: .init(), groupName: .init(), group: .init(members: .init()))
    }
}

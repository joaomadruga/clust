//
//  ListOfMembersScreenView.swift
//  clust
//
//  Created by Gustavo Hollanda on 23/03/23.
//

import SwiftUI

struct SeeAllPeopleView: View {
    let globalStyle: GlobalStyle
    var body: some View {
        NavigationView {
            VStack {
                HeaderTitleView(text: "Integrantes")
                ListOfPeopleView(globalStyle: globalStyle, username: "Madu", description: "Dua Lipa e Taylor Swift")
            }
        }
    }
}

struct SeeAllPeopleView_Previews: PreviewProvider {
    static var previews: some View {
        SeeAllPeopleView(globalStyle: .init())
            .allScreensStyle()
    }
}

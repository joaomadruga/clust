//
//  ListOfPeopleView.swift
//  clust
//
//  Created by Gustavo Hollanda on 21/03/23.
//

import SwiftUI

struct ListOfPeopleView: View {
    let globalStyle: GlobalStyle
    @State var username: String
    
    func teste(){
        print("hello world")
    }
    var body: some View {
        NavigationView {
            HStack{
                Image("Memoji")
                VStack(alignment: .leading, spacing: 10){
                    Text(username)
                        .font(
                            .system(size: 20)
                            .weight(.bold)
                        )
                    
                    Text("Quer focar em Design, Gestures...")
                        .foregroundColor(globalStyle.systemGrey2)
                }
            Spacer()
            }
        }
    }
}

struct ListOfPeopleView_Previews: PreviewProvider {
    static var previews: some View {
        ListOfPeopleView(globalStyle: .init(), username: "joao").allScreensStyle()
    }
}


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
    @State var description: String
    
    var body: some View {
        NavigationView {
            ScrollView{
                HStack{
                    Image("Memoji")
                    VStack(alignment: .leading, spacing: 10){
                        Text(username)
                            .font(
                                .system(size: 20)
                                .weight(.bold)
                            )
                        Text("Quer focar em Design, Gestures...")
                        Text(description)
                            .foregroundColor(globalStyle.systemGrey2)
                    }
                    Spacer()
                }
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.white)
                .scrollContentBackground(.hidden)
                HStack{
                    Image("Memoji")
                    VStack(alignment: .leading, spacing: 10){
                        Text(username)
                            .font(
                                .system(size: 20)
                                .weight(.bold)
                            )
                        
                        
                        Text(description)
                            .foregroundColor(globalStyle.systemGrey2)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.white)
                .scrollContentBackground(.hidden)
            }
        }
    }
}

struct ListOfPeopleView_Previews: PreviewProvider {
    static var previews: some View {
        ListOfPeopleView(globalStyle: .init(), username: "joao", description: "teste description").allScreensStyle()
    }
}

//
//  FindTopicView.swift
//  clust
//
//  Created by João Madruga on 27/03/23.
//

import SwiftUI

struct FindTopicView: View {
    let globalStyle: GlobalStyle
    var searchText: Binding<String>
    let listofFindTopics: [String] = ["Swift UI", "Apple Pencil", "AR/VR", "Acessibilidade", "Gestures", "Wallet"]
    
    var body: some View {
        VStack{
            Text("Descubra")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(globalStyle.systemGrey2)
                .padding([.bottom, .top], 8)
                
            HStack {
                VStack {
                    ForEach(listofFindTopics.prefix(listofFindTopics.count/2), id: \.self.hashValue) { topicName in
                        Button(action: {
                            searchText.wrappedValue = topicName
                        }) {
                            HStack {
                                Image(systemName: "magnifyingglass")
                                Text(topicName)
                                    .font(.headline)
                                    .fontWeight(.regular)
                            }
                            .foregroundColor(globalStyle.mainGreen)
                            .padding(.bottom, 4)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
                Spacer()
                VStack {
                    ForEach(listofFindTopics.suffix(listofFindTopics.count/2), id: \.self.hashValue) { topicName in
                        Button(action: {
                            searchText.wrappedValue = topicName
                        }) {
                            HStack {
                                Image(systemName: "magnifyingglass")
                                Text(topicName)
                                    .font(.headline)
                                    .fontWeight(.regular)
                            }
                            .foregroundColor(globalStyle.mainGreen)
                            .padding(.bottom, 4)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}

struct FindTopicView_Previews: PreviewProvider {
    static var previews: some View {
        FindTopicView(globalStyle: .init(), searchText: .constant("")).allScreensStyle()
    }
}

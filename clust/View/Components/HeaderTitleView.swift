//
//  HeaderTitleView.swift
//  clust
//
//  Created by João Madruga on 19/03/23.
//

import SwiftUI

struct HeaderTitleView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.largeTitle)
            .foregroundColor(Color(UIColor.label))
            .fontWeight(.bold)
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0))
    }
}

struct HeaderTitleView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderTitleView(text: "Hello World!")
    }
}

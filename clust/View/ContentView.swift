//
//  ContentView.swift
//  clust
//
//  Created by João Madruga on 16/03/23.
//

import SwiftUI

struct ContentView: View {
    let globalStyle = GlobalStyle()
    
    var body: some View {
        NavigationStack {
            //StartScreenView(globalStyle: globalStyle).allScreensStyle()
            CreateProfileView(globalStyle: globalStyle).allScreensStyle()
        }
        .colorScheme(.light)
        .accentColor(globalStyle.mainGreen)
    }
}



extension View {
    func allScreensStyle() -> some View {
        self.background(.white)
            .padding(16)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

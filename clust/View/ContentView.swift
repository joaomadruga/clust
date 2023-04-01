//
//  ContentView.swift
//  clust
//
//  Created by João Madruga on 16/03/23.
//

import SwiftUI

struct ContentView: View {
    let globalStyle = GlobalStyle()
    @State var memojiText = ""
    @State var imageBase64String: String?
    @State private var image: UIImage? = nil
    
    var body: some View {
        NavigationStack {
            //StartScreenView(globalStyle: globalStyle).allScreensStyle()
            MemojiInputView(memojiText: $memojiText, imageBase64String: $imageBase64String)
                .frame(alignment: .center)
                .frame(width: 150, height: 150)
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

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
            StartScreenView(globalStyle: globalStyle).allScreensStyle()
            /*
            VStack {
                MemojiInputView(memojiText: $memojiText, imageBase64String: $imageBase64String)
                        .padding()
                        .onReceive(NotificationCenter.default.publisher(for: UIPasteboard.changedNotification)) { _ in
                            print("pasteboard changed.")
                            if let image = UIPasteboard.general.image {
                                //print(UIPasteboard.general.items)
                                let imageData = image.jpegData(compressionQuality: 1.0)!
                                let base64String = imageData.base64EncodedString()
                                imageBase64String = base64String
                            }
                        }
                if let imageBase64String = imageBase64String, let imageData = Data(base64Encoded: imageBase64String), let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                }
            }
            */
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

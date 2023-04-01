//
//  MemojiSelectorView.swift
//  clust
//
//  Created by João Madruga on 31/03/23.
//

import SwiftUI

struct MemojiSelectorView: View {
    @Binding var imageBase64String: String?
    let globalStyle: GlobalStyle = .init()
    
    var body: some View {
        VStack {
            if  let imageBase64String = imageBase64String,
                let imageData = Data(base64Encoded: imageBase64String),
                let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .aspectRatio(contentMode: .fill)
            } else {
                VStack {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Toque para inserir seu Memoji")
                        .multilineTextAlignment(.center)
                        .fontWeight(.bold)
                }.padding(20)
            }
        }
        .frame(width: 150, height: 150)
        .foregroundColor(globalStyle.systemGrey2)
        .background(globalStyle.systemGrey6)
        .cornerRadius(150)
        .overlay(
            Circle()
                .strokeBorder(globalStyle.systemGrey5,lineWidth: 4)
        )
        
    }
        
}

struct MemojiSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        MemojiSelectorView(imageBase64String: .constant(.init()))
    }
}

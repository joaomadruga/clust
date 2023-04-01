//
//  MemojiSelectorView.swift
//  clust
//
//  Created by João Madruga on 31/03/23.
//

import SwiftUI

struct MemojiSelectorView: View {
    @Binding var imageBase64String: String?
    @Binding var backgroundColor: LinearGradient
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
                            .fontWeight(.light)
                            .frame(width: 20, height: 20)
                            .foregroundColor(globalStyle.memojiInputBlack)
                        Text("Toque para inserir seu Memoji")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 13))
                            .fontWeight(.medium)
                            .foregroundColor(globalStyle.memojiInputBlack)
                    }.padding(15)
                }
            }
            .frame(width: 150, height: 150)
            .foregroundColor(globalStyle.systemGrey2)
            .background(backgroundColor)
            .cornerRadius(150)
            .overlay(
                Circle()
                    .strokeBorder(Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.1), lineWidth: 2)
        )
    }
        
}

struct MemojiSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        MemojiSelectorView(imageBase64String: .constant(.init()), backgroundColor: .constant(GlobalStyle().linearGray))
    }
}

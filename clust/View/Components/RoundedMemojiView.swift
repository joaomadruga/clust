//
//  RoundedMemojiView.swift
//  clust
//
//  Created by João Madruga on 21/04/23.
//

import SwiftUI

struct RoundedMemojiView: View {
    let base64String: String
    let backgroundIndex: Int
    let width: CGFloat
    let height: CGFloat
    let currentCheckedColor: CurrentCheckedColorModel = .init()
    
    var body: some View {
        Group {
            if let imageData = Data(base64Encoded: base64String),
               let image = UIImage(data: imageData) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width, height: height)
                    .background(currentCheckedColor.listOfColors[backgroundIndex])
                    .cornerRadius(60)
                    
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width, height: height)
                    .background(currentCheckedColor.listOfColors[backgroundIndex])
                    .cornerRadius(60)
            }
        }
    }
}


struct RoundedMemojiView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedMemojiView(base64String: .init(), backgroundIndex: 0, width: 40, height: 40)
    }
}

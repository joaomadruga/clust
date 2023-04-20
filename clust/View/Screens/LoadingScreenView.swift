//
//  LoadingScreenView.swift
//  clust
//
//  Created by João Madruga on 03/04/23.
//

import SwiftUI

struct LoadingScreenView: View {
    let globalStyle: GlobalStyle
    let text: String
    let destinationScreen: any View
    
    @State var timeRemaining = 5
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var showNextScreen: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing:20) {
                ProgressView()
                    .scaleEffect(1.3)
                    
                Text(text)
                    .multilineTextAlignment(.center)
                    .foregroundColor(globalStyle.systemGrey1)
            }.padding(40)
            Spacer()
            Image("GrayIcon")
        }
        .onReceive(timer) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                showNextScreen = true
            }
        }
        .navigationDestination(isPresented: $showNextScreen) {
            AnyView(destinationScreen).allScreensStyle()
        }
    }
}

struct LoadingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreenView(globalStyle: .init(), text: "Por favor, aguarde todos resolverem suas crises existenciais enquanto pensam no tema. 🫂💭", destinationScreen: EmptyView()).allScreensStyle()
    }
}

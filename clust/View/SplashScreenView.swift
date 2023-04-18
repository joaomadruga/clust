//
//  SplashScreenView.swift
//  clust
//
//  Created by José Cordeiro on 15/04/23.
//

import SwiftUI

struct SplashScreenView: View {
    let globalStyle: GlobalStyle // por algum motivo n ta funfando
    
    @State var changeBackgroundTimer = 1.2
    @State var currentBackground: Color = GlobalStyle().mainGreen
    
    @State var changeViewTimer = 2.5 // tempo de duracao da Splash Screen
    @State private var isOver = false
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        NavigationStack {
            LottieView(lottieFile: "clust")
                .frame(width: 400, height: 400)
                .onReceive(timer) { _ in
                    if changeBackgroundTimer > 0 {
                        changeBackgroundTimer -= 0.1
                    } else {
                        currentBackground = .white
                    }
                }
                .frame(maxHeight: .infinity)
                .frame(maxWidth: .infinity)
                .background(currentBackground)
            
            NavigationLink(destination: FormGroupView(globalStyle: .init()).allScreensStyle(), isActive: $isOver) {
                EmptyView()
            } // 
                .onReceive(timer) { _ in
                    if changeViewTimer > 0 {
                        changeViewTimer -= 0.1
                    } else {
                        isOver = true
                    }
                }
        }
    }
}


struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView(globalStyle: .init())
    }
}

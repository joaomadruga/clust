//
//  LottieView.swift
//  clust
//
//  Created by José Cordeiro on 06/04/23.
//

import SwiftUI
import Lottie


struct LottieView: UIViewRepresentable {
    let lottieFile: String

    let animationView = LottieAnimationView()

    func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: .zero)

        animationView.animation = LottieAnimation.named(lottieFile)
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        //animationView.loopMode = .loop
        //animationView.tintColor

        view.addSubview(animationView)

        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        animationView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true


        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {

    }
}


struct LottieView_Previews: PreviewProvider {
    static var previews: some View {
        LottieView(lottieFile: "clust.json")
    }
}

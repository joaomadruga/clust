//
//  ChooseAreaView.swift
//  clust
//
//  Created by João Madruga on 20/03/23.
//

import SwiftUI

struct ChooseAreaView: View {
    let globalStyle: GlobalStyle
    
    var body: some View {
        VStack{
            HeaderTitleView(text: "Em qual área de aprendizagem deseja focar neste desafio?")
            ListOfSelectionsView(globalStyle: globalStyle, listOfSelectionsView: [.init(index: 0, text: "Desenvolvimento"), .init(index: 1, text: "Design"), .init(index: 2, text: "Inovação")])
        }
        .frame(maxWidth: .infinity)
    }
}

struct ChooseAreaView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseAreaView(globalStyle: .init()).allScreensStyle()
    }
}
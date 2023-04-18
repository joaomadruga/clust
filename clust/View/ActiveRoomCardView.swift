//
//  ActiveRoomCardView.swift
//  clust
//
//  Created by José Cordeiro on 12/04/23.
//

import SwiftUI

struct ActiveRoomCardView: View {
    let challengeName: String
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Aqui vao entrar os memojis") // Room preview, acredito que seja melhor a gente tirar a imagem desse componente
                .frame(maxWidth: .infinity, minHeight: 350)
                .background(Color.gray)
            VStack(alignment: .leading, spacing: 8) {
                Text(challengeName)
                    .font(.headline)
                Text("Aguardando participantes...")
                    .font(.subheadline)
                //falta adicionar o secondary button de joao
            }
            .padding(16)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.1), radius: 10, y:8)
    }
}

struct ActiveRoomCardView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveRoomCardView(challengeName: "Teste")
    }
}

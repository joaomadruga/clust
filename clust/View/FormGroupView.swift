//
//  FormGroupView.swift
//  clust
//
//  Created by José Cordeiro on 12/04/23.
//

import SwiftUI

struct FormGroupView: View {
    let globalStyle: GlobalStyle
    let activeRooms: Bool = true
    let listOfChallenges: [String] = ["Foundations", "Pear", "Paris", "Teste"]
    //let finishedRooms: Bool
    @State private var selected = 0
    
    var body: some View {
        VStack {
            HStack {
                HeaderTitleView(text: "Formar Equipe")
                Spacer()
                Circle().frame(width: 40).padding(.bottom, 30)
            }
            
            Picker(selection: $selected, label: Text("Tabs")) {
                Text("Salas Ativas").tag(0)
                Text("Salas Finalizadas").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.bottom, 16)
            
            
            if selected == 0 {
                if activeRooms {
                    ScrollView() {
                        ForEach(listOfChallenges, id: \.self.hashValue) { challengeName in
                            ActiveRoomCardView(challengeName: challengeName)
                                .padding(.bottom, 16)// @TODO: condicionar a quantidade de cards com a quantidade de salas
                        }
                    }
                    
                } else {
                    VStack {
                        Text("Nenhuma sala ativa no momento.")
                            .bold()
                            .padding([.bottom, .top], 8)
                        Text("Aguarde a criação de uma sala e verifique se seu iPhone está conectado na mesma rede Wi-Fi")
                            .multilineTextAlignment(.center)
                            .foregroundColor(globalStyle.systemGrey2)
                    }
                    Spacer()
                }
            } else {
                Text("View 2") // ainda não fiz essa parte pois vou fazer uma FinishedRoomListItemView() ainda
                Spacer()
                }
            }
        }
}

struct FormGroupView_Previews: PreviewProvider {
    static var previews: some View {
        FormGroupView(globalStyle: .init()).allScreensStyle()
    }
}

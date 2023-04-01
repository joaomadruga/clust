//
//  FormGroupView.swift
//  clust
//
//  Created by José Cordeiro on 23/03/23.
//

import SwiftUI

import SwiftUI

struct FormGroupView: View {
    @State private var selectedSegment = 0
    
    var body: some View {
        VStack {
            Picker("", selection: $selectedSegment) {
                Text("Salas Ativas").tag(0)
                Text("Salas Finalizadas").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            if selectedSegment == 0{
                CardView()
            } else{
                Text("lorem ipsummnkdfsn")
            }
            Spacer()
        }
        .navigationBarTitle("Formar Equipe", displayMode: .large)
        .frame(maxWidth: .infinity)
        
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            Text("Challenge Paris")
                .font(.title)
                //.frame(alignment: .left)
            Text("Aguardando participantes...")
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(16)
        .background(Color.gray)
        .cornerRadius(16)
        .shadow(radius: 5)

    }
}

struct FormGroupView_Previews: PreviewProvider {
    static var previews: some View {
        FormGroupView()
    }
}

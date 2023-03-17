//
//  ContentView.swift
//  clust
//
//  Created by João Madruga on 16/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            StartScreenView()
        }
        .padding(16)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

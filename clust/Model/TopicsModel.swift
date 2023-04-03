//
//  TopicsModel.swift
//  clust
//
//  Created by João Madruga on 25/03/23.
//

import Foundation
import SwiftUI

struct TopicsModel {
    var listOfTopics: [String] = ["Swift UI", "AR/VR", "Gestures", "Apple Wallet", "Acessibilidade", "Apple Pencil"]
    var searchText: Binding<String>
}

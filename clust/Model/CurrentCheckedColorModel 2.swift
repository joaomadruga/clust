//
//  CurrentCheckedColorModel.swift
//  clust
//
//  Created by João Madruga on 01/04/23.
//

import Foundation
import SwiftUI

struct CurrentCheckedColorModel {
    let listOfColors: [LinearGradient]
    var index: Int
    var color: LinearGradient
    
    init() {
        self.listOfColors = [GlobalStyle().linearGray, GlobalStyle().linearPurple, GlobalStyle().linearRed, GlobalStyle().linearOrange, GlobalStyle().linearBrown, GlobalStyle().linearBlue, GlobalStyle().linearGreen]
        self.index = 0
        self.color = GlobalStyle().linearGray
    }
}

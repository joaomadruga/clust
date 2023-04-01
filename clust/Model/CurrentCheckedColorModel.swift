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
        self.listOfColors = [GlobalStyle().linearPurple, GlobalStyle().linearRed, GlobalStyle().linearOrange, GlobalStyle().linearBrown, GlobalStyle().linearBlue, GlobalStyle().linearGreen, GlobalStyle().linearGray]
        self.index = -1
        self.color = LinearGradient(colors: [GlobalStyle().systemGrey5, GlobalStyle().systemGrey5], startPoint: .top, endPoint: .bottom)
    }
}

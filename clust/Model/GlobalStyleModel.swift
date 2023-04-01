//
//  GlobalStyleModel.swift
//  clust
//
//  Created by João Madruga on 18/03/23.
//

import Foundation
import SwiftUI

struct GlobalStyle {
    let mainGreen: Color = Color(red: 9/255, green: 90/255, blue: 107/255, opacity: 1.0)
    let secondaryGreen: Color = Color(red: 12/255, green: 113/255, blue: 135/255, opacity: 1.0)
    let lightGreen: Color = Color(red: 220/255, green: 246/255, blue: 246/255, opacity: 1.0)
    let systemGrey1: Color = Color(red: 61/255, green: 60/255, blue: 70/255, opacity: 1.0)
    let systemGrey2: Color = Color(red: 130/255, green: 130/255, blue: 136/255, opacity: 1.0)
    let systemGrey5: Color = Color(red: 229/255, green: 229/255, blue: 234/255, opacity: 1.0)
    let systemGrey6: Color = Color(red: 244/255, green: 244/255, blue: 245/255, opacity: 1.0)
    let inputGrey: Color = Color(red: 118/255, green: 118/255, blue: 128/255, opacity: 0.12)
    let linearPurple: LinearGradient = LinearGradient(colors: [Color(red: 225/255, green: 217/255, blue: 253/255, opacity: 1.0), Color(red: 210/255, green: 197/255, blue: 253/255, opacity: 1.0)], startPoint: .top, endPoint: .bottom)
    let linearRed: LinearGradient = LinearGradient(colors: [Color(red: 255/255, green: 199/255, blue: 196/255, opacity: 1.0), Color(red: 255/255, green: 199/255, blue: 208/255, opacity: 1.0)], startPoint: .top, endPoint: .bottom)
    let linearOrange: LinearGradient = LinearGradient(colors: [Color(red: 250/255, green: 237/255, blue: 198/255, opacity: 1.0), Color(red: 255/255, green: 212/255, blue: 154/255, opacity: 1.0)], startPoint: .top, endPoint: .bottom)
    let linearBrown: LinearGradient = LinearGradient(colors: [Color(red: 255/255, green: 212/255, blue: 206/255, opacity: 1.0), Color(red: 206/255, green: 186/255, blue: 178/255, opacity: 1.0)], startPoint: .top, endPoint: .bottom)
    let linearBlue: LinearGradient = LinearGradient(colors: [Color(red: 208/255, green: 241/255, blue: 255/255, opacity: 1.0), Color(red: 183/255, green: 230/255, blue: 253/255, opacity: 1.0)], startPoint: .top, endPoint: .bottom)
    let linearGreen: LinearGradient = LinearGradient(colors: [Color(red: 202/255, green: 244/255, blue: 210/255, opacity: 1.0), Color(red: 179/255, green: 229/255, blue: 187/255, opacity: 1.0)], startPoint: .top, endPoint: .bottom)
    let linearGray: LinearGradient = LinearGradient(colors: [Color(red: 222/255, green: 222/255, blue: 223/255, opacity: 1.0), Color(red: 207/255, green: 207/255, blue: 209/255, opacity: 1.0)], startPoint: .top, endPoint: .bottom)
}

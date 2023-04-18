//
//  ButtonUserTypeView.swift
//  clust
//
//  Created by João Madruga on 18/03/23.
//

import SwiftUI

struct ButtonUserTypeView: View {
    let globalStyle: GlobalStyle
    let isStudentButton: Bool
    let isButtonChecked: Bool
    
    
    var body: some View {
        VStack {
            Text(isStudentButton ? "Estudante" : "Mentora")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(isButtonChecked ? globalStyle.mainGreen : globalStyle.systemGrey1)
            
            HStack {
                Image(systemName: "checkmark")
                    .resizable()
                    .frame(width: 10, height: 10)
                Text("Participa de salas de formação de equipes")
                    .font(.caption)
                    .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                Image(systemName: isStudentButton ? "xmark" : "checkmark")
                    .resizable()
                    .frame(width: 10, height: 10)
                Text("Participa de salas de formação de equipes")
                    .font(.caption)
                    .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .foregroundColor(isButtonChecked ? globalStyle.mainGreen : globalStyle.systemGrey2)
        .frame(maxWidth: .infinity)
        .padding(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(isButtonChecked ? globalStyle.mainGreen : globalStyle.systemGrey5, lineWidth: 4)
        )
        .background(isButtonChecked ? globalStyle.lightGreen : .white)
        .cornerRadius(16)
    }
}

struct ButtonUserTypeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ButtonUserTypeView(globalStyle: .init(), isStudentButton: true, isButtonChecked: true)
            ButtonUserTypeView(globalStyle: .init(), isStudentButton: false, isButtonChecked: false)
        }
    }
}

//
//  FormedGroupView.swift
//  clust
//
//  Created by João Madruga on 26/04/23.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct FormedGroupView: View {
    let globalStyle: GlobalStyle
    @ObservedObject var formGroupViewModel: FormGroupViewModel
    var currentRoom: RoomModel
    @State private var showingSheet = true
    @State private var showingAlert = false
    @ObservedObject var splashScreenViewModel: SplashScreenViewModel = .init()
    
    
    @State private var link = ""
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)

        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }

        return UIImage(systemName: "qrcode") ?? UIImage()
    }
    
    var body: some View {
        ScrollView {
            VStack {
                NavigationLink(destination: FormGroupView(globalStyle: globalStyle, loginModel: splashScreenViewModel.loginModel).allScreensStyle()) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .foregroundColor(globalStyle.mainGreen)
                            .aspectRatio(contentMode: .fit)
                        Text("Início")
                            .foregroundColor(globalStyle.mainGreen)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 10)
                HeaderTitleView(text: "Challenge \(currentRoom.roomName)")
                Button(action: { showingSheet.toggle() }) {
                    HStack {
                        Text("Ver detalhes dos integrantes")
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(globalStyle.systemGrey3)
                    }
                    .padding(16)
                    .background(globalStyle.systemGrey6)
                    .cornerRadius(16)
                }
                Text("COLECIONÁVEL DA EQUIPE")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(globalStyle.systemGrey2)
                
                Image(systemName: "WalletButton")
                VStack {
                    HStack {
                        Image(systemName: "apple.logo")
                            .foregroundColor(globalStyle.systemGrey1)
                            .font(.system(size: 24))
                        Text("Apple Developer Academy")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    VStack {
                        HStack(spacing: -16) {
                            ForEach(currentRoom.listOfGroups.first(where: {
                                for member in $0.members {
                                    if member.peerID.displayName == formGroupViewModel.peerID.displayName {
                                        return true
                                    }
                                }
                                return false
                            })?.members ?? [], id: \.self.hashValue) { member in
                                RoundedMemojiView(base64String: member.memoji, backgroundIndex: Int.random(in: 0..<7), width: 64, height: 64)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(20)
                        .padding(.bottom, -52)
                        .background(globalStyle.lightGreen)
                    }
                    .padding([.leading, .trailing], -20)
                    .padding(.bottom, 12)
                    
                    Text("INTEGRANTES")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 32)
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(globalStyle.systemGrey2)
                    
                    Text(currentRoom.listOfGroups.first(where: {
                        for member in $0.members {
                            if member.peerID.displayName == formGroupViewModel.peerID.displayName {
                                return true
                            }
                        }
                        return false
                    })?.members.map({ return $0.name }).joined(separator: ", ") ?? "")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .textCase(.uppercase)
                    
                    Text("CHALLENGE")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(globalStyle.systemGrey2)
                        .padding(.top, 12)
                    
                    Text(currentRoom.roomName).frame(maxWidth: .infinity, alignment: .leading).textCase(.uppercase)
                    
                    Image(uiImage: generateQRCode(from: link))
                        .interpolation(.none)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .padding(.top, 16)
                        .padding(.bottom, 20)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(globalStyle.inputGrey, lineWidth: 3)
                )
                .background(.white)
                .cornerRadius(16)
                
                
                Button(action: {
                    showingAlert.toggle()
                }) {
                    HStack {
                        Text("Adicionar link para o artefato final")
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(globalStyle.systemGrey3)
                    }
                    .padding(16)
                    .background(globalStyle.systemGrey6)
                    .cornerRadius(16)
                    
                }
                .alert("Artefato final", isPresented: $showingAlert) {
                    TextField("link para o artefato", text: $link)
                    Button("OK", action: {})
                } message: {
                    Text("Insira abaixo o link para seu artefato final do Challenge.")
                }
                
                Text("Adicionando um link o seu artefato final poderá ser facilmente acessado através do colecionável da equipe na Wallet")
                    .foregroundColor(globalStyle.systemGrey2)
                
                Spacer()
                
                
            }
            .sheet(isPresented: $showingSheet) {
                ListOfMembersView(globalStyle: globalStyle, currentGroup: currentRoom.listOfGroups.first(where: {
                    for member in $0.members {
                        if member.peerID.displayName == formGroupViewModel.peerID.displayName {
                            return true
                        }
                    }
                    return false
                }) ?? GroupModel(members: [])).allScreensStyle()
        }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct FormedGroupView_Previews: PreviewProvider {
    static var previews: some View {
        FormedGroupView(globalStyle: .init(), formGroupViewModel: .init(), currentRoom: .init(roomOwner: .init(), defineArea: .init(), roomOwnerName: .init())).allScreensStyle()
    }
}

//
//  FormGroupView.swift
//  clust
//
//  Created by José Cordeiro on 12/04/23.
//
import SwiftUI

struct FormGroupView: View {
    let globalStyle: GlobalStyle
    let loginModel: LoginModel
    @State private var selected = 0
    @StateObject var viewModel = FormGroupViewModel()

    var body: some View {
        VStack {
            if !loginModel.isStudent {
                HStack {
                    Spacer()
                    NavigationLink(destination: AnyView(CreateRoomView(globalStyle: globalStyle, formGroupViewModel: viewModel, roomOwnerName: loginModel.name)).allScreensStyle())  {
                        Text("Nova sala")
                        Image(systemName: "plus")
                    }
                }.foregroundColor(globalStyle.mainGreen)
            }
            HStack {
                HeaderTitleView(text: "Formar Equipe")
                Spacer()
                RoundedMemojiView(base64String: loginModel.profileImage, backgroundIndex: loginModel.profileImageBackgroundIndex, width: 40, height: 40)
                    .padding(.bottom, 30)
            }

            Picker(selection: $selected, label: Text("Tabs")) {
                Text("Salas Ativas").tag(0)
                Text("Salas Finalizadas").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.bottom, 16)

            if selected == 0 {
                if viewModel.availableRooms.filter({ return $0.isRoomOpen }).count > 0 {
                    ScrollView() {
                        ForEach(viewModel.availableRooms, id: \.self.hashValue) { room in
                            ActiveRoomCardView(globalStyle: globalStyle, room: room, userMemoji: loginModel.profileImage, userName: loginModel.name)
                                .environmentObject(viewModel)
                                .padding(.bottom, 16)
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
                Text("Você ainda não participou de nenhuma sala de formação de equipe.")
                    .multilineTextAlignment(.center)
                    .foregroundColor(globalStyle.systemGrey2)
                    .padding(.top, 8)
                Spacer()
                }
            }
        .navigationBarBackButtonHidden(true)
        .onAppear() {
            viewModel.advertiseLeftRoom(peer: viewModel.peerID)
        }
        }
}

struct FormGroupView_Previews: PreviewProvider {
    static var previews: some View {
        FormGroupView(globalStyle: .init(), loginModel: .init()).allScreensStyle()
    }
}

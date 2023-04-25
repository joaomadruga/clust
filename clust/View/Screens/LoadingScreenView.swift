//
//  LoadingScreenView.swift
//  clust
//
//  Created by João Madruga on 03/04/23.
//

import SwiftUI
import Combine

struct LoadingScreenView: View {
    let globalStyle: GlobalStyle
    let text: String
    let destinationScreen: any View
    let prevScreen: String
    var currentRoom: RoomModel
    @ObservedObject var formGroupViewModel: FormGroupViewModel
    @StateObject var viewModel: LoadingScreenViewModel
    @State var showNextView: Bool = false
    
    init(globalStyle: GlobalStyle, text: String, destinationScreen: any View, formGroupViewModel: FormGroupViewModel, currentRoom: RoomModel, prevScreen: String) {
        self.globalStyle = globalStyle
        self.text = text
        self.destinationScreen = destinationScreen
        self.formGroupViewModel = formGroupViewModel
        self.currentRoom = currentRoom
        self.prevScreen = prevScreen
        self._viewModel = StateObject(wrappedValue: LoadingScreenViewModel(formGroupViewModel: formGroupViewModel, currentRoom: currentRoom))
    }
    
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing:20) {
                ProgressView()
                    .scaleEffect(1.3)
                    
                Text(text)
                    .multilineTextAlignment(.center)
                    .foregroundColor(globalStyle.systemGrey1)
            }.padding(40)
            Spacer()
            Image("GrayIcon")
        }
        .navigationDestination(isPresented: $showNextView) {
            AnyView(destinationScreen).allScreensStyle()
        }
        .onReceive(Just(formGroupViewModel.availableRooms)) { availableRooms in
            // this works properly
            print("opa macacos me mordam recebi uma nova sala")
            print(prevScreen)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                if (prevScreen == "ChooseTopicView") {
                    showNextView = !viewModel.waitArea()
                } else if (prevScreen == "ChooseTopThreeTopicsView") {
                    showNextView = !viewModel.waitListOfTopics()
                } else if (prevScreen == "MentorWaitRoomView") {
                    showNextView = !viewModel.waitFormGroups()
                }
            }
        }
    }
}

struct LoadingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreenView(globalStyle: .init(), text: .init(), destinationScreen: EmptyView(), formGroupViewModel: .init(), currentRoom: .init(roomOwner: .init(), defineArea: .init(), roomOwnerName: .init()), prevScreen: "ChooseTopicView").allScreensStyle()
    }
}

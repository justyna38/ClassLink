//
//  DepartNavView.swift
//  TrueClassLinkProject
//
//  Created by Abdellah Skoundri on 20/03/2024.
//

import SwiftUI

struct DepartNavView: View {
    @StateObject var viewModel = MotivationViewModel()
    @State private var selection = 0
    @State private var shouldAnimateButton = false
    //    @State private var isPressed = false
    //    @State private var isHovered = false
    var mess: Message
    var hist: MessageHistorique
    
    var body: some View {
        //        NavigationView {
        ZStack {
            Image("backgroundBase")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Text("Tes motivations")
                    .font(.custom("SF Pro", size: 24))
                    .fontWeight(.bold)
                    .foregroundColor(Color.orangeEdu)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top,80)
                    .padding(30)
                
                TabView(selection: $selection) {
                    QuestionListView(viewModel: viewModel, selection: $selection)
                        .tag(0)
                    
                    DiagExpectations(mess: mess, hist: hist)
                        .tag(1)
                    DiagDifficulties(hist: hist, mess: mess)
                        .tag(2)
                    QuestionListView(viewModel: viewModel, selection: $selection)
                        .tag(1)
                }
                
                
                
                VStack {
                    
                    HStack(spacing: 20) {
                        ForEach(0..<3) { index in
                            Circle()
                                .frame(width: 10, height: 10)
                                .foregroundColor(index == selection ? Color.orange : Color.gray)
                                .scaleEffect(index == selection ? 1.2 : 1.0, anchor: .center)
                                .animation(.easeInOut(duration: 0.5), value:selection)
                        }
                    }
                    .padding(.top, 20)
                    .offset(x: 0, y: -50)
                }
            }
        }
    }
}

#Preview {
    DepartNavView(mess: Message(auteur: User(email: "", mdp: "", name: "", surname: "", mood: Mood(moodIcon: ""), enCeMoment: EnCeMoment(myMusic: "", myPride: "", myChallenge: "")), destinaire: User(email: "", mdp: "", name: "", surname: "", mood: Mood(moodIcon: ""), enCeMoment: EnCeMoment(myMusic: "", myPride: "", myChallenge: "")), typeQuestion: .poserQuest, message: "")
, hist: MessageHistorique())
}


//
//  MainView.swift
//  TrueClassLinkProject
//
//  Created by Justyna Warzecha on 19/03/2024.
//

import SwiftUI

struct MainView: View {
    var hist: MessageHistorique
    var mess: Message
    var body: some View {
        TabView {
            CourseChoice(hist: hist)
                .tabItem {
                    Label("Menu", systemImage: "list.bullet.clipboard.fill")
                }
            QuestionClass(message: mess, hist: hist)
                .tabItem {
                    Label("Question", systemImage: "questionmark.bubble.fill")
                }
           Tendances()
                .tabItem {
                    Label("Tendences", systemImage: "chart.bar.fill")
                }
           PageProfilComplete()
                .tabItem {
                    Label("Profil", systemImage: "person.fill")
                }
            
        }
        .accentColor(.orangeEdu)
    }
}

#Preview {
    MainView(hist: MessageHistorique(), mess: Message(auteur: User(email: "", mdp: "", name: "", surname: "", mood: Mood(moodIcon: ""), enCeMoment: EnCeMoment(myMusic: "", myPride: "", myChallenge: "")), destinaire: User(email: "", mdp: "", name: "", surname: "", mood: Mood(moodIcon: ""), enCeMoment: EnCeMoment(myMusic: "", myPride: "", myChallenge: "")), typeQuestion: .poserQuest, message: ""))
}

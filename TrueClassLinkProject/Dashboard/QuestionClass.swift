//
//  Question.swift
//  TrueClassLinkProject
//
//  Created by Apprenant98 on 12/03/2024.
//

import SwiftUI

struct QuestionClass: View {
    @ObservedObject var message: Message
    @ObservedObject var hist: MessageHistorique
    @State var textArea: String = ""
    @State var selectedType: TypeQuestion?
    @State private var showModal: Bool = false
    @State private var clickedType: TypeQuestion?
    @ObservedObject var currentProfile: User = User(email: "ff", mdp: "dd", name: "Vache", surname: "Julie", mood: Mood(moodIcon: "moodNone"), enCeMoment: EnCeMoment(myMusic: "", myPride: "", myChallenge: ""))
    @ObservedObject var destinaire: User = User(email: "", mdp: "", name: "Kowalski", surname:"Pierre", mood: Mood(moodIcon: "moodNone"), enCeMoment: EnCeMoment(myMusic: "", myPride: "", myChallenge: ""))
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("backgroundBase")
                    .resizable()
                    .ignoresSafeArea()
                VStack{
                    ForEach(TypeQuestion.allCases, id: \.rawValue) { type in
                        Button(action: {
                            selectedType = type
                            message.setTypeQuestion(type: type)
                            showModal.toggle()
                            clickedType = type
                        }) {
                            Text(type.rawValue)
                                .foregroundColor(.white)
                                .font(.headline)
                                .frame(width: 200, height: 50)
                                .background(.orangeEdu)
                                .opacity(clickedType == type || clickedType == nil ? 1.0 : 0.5)
                                .cornerRadius(10)
                                .padding()
                        }
                        
                    }
                    .sheet(isPresented: $showModal) {
                        if let type = selectedType {
                            QuestionClassModale(selectedType: type, message: Message(auteur: currentProfile, destinaire: destinaire, typeQuestion: type, message: textArea), hist: hist)
                        }
                        
                    }
                    //                    NavigationLink(destination: QuestionHistory(messageHistorique: hist)){
                    //                        Text("coucou")
                    //                    }
                    //                    Button(action: {
                    //                        print(hist.historique.count)
                    //                    }, label: {
                    //                        Text("Button")
                    //                    })
                    NavigationLink(destination: ProfQuestionView()) {
                        Circle()
                            .frame(width: 20)
                            .foregroundStyle(.lightGrayEdu)
                    }
                }
               
            }
            .navigationTitle("Poser une question")
        }
        
        
    }
}

#Preview {
    QuestionClass(message: Message(auteur: User(email: "", mdp: "", name: "", surname: "", mood: Mood(moodIcon: "moodNone"), enCeMoment: EnCeMoment(myMusic: "", myPride: "", myChallenge: "")), destinaire: User(email: "", mdp: "", name: "", surname: "", mood: Mood(moodIcon: "moodNone"), enCeMoment: EnCeMoment(myMusic: "", myPride: "", myChallenge: "")), typeQuestion: .poserQuest, message: ""), hist: MessageHistorique())
}




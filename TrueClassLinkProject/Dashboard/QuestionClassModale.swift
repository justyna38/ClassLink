//
//  QuestionClassModale.swift
//  TrueClassLinkProject
//
//  Created by Justyna Warzecha on 18/03/2024.
//

import SwiftUI

struct QuestionClassModale: View {
    
    var selectedType: TypeQuestion
    @ObservedObject  var message: Message
    @ObservedObject var hist: MessageHistorique = MessageHistorique()
    @ObservedObject var currentProfile: User = User(email: "ff", mdp: "dd", name: "aa", surname: "dd", mood: Mood(moodIcon: "moodNone"), enCeMoment: EnCeMoment(myMusic: "", myPride: "", myChallenge: ""))
    //    @ObservedObject var destinaire: Prof = Prof(email: "", mdp: "", name: "Kowalski", surname:"Pierre", classesProf: [Classes(name: "2nd")], discipline: [.svt])
    @State var messageText: String = ""
    @State private var messageSent: Bool = false
    @State private var showAlert: Bool = false
    
    
    var body: some View {
        NavigationStack{
            
            VStack(alignment: .leading){
                
                if !messageSent {
                    Text("Objet : \(selectedType.rawValue)")
                    
                    RadioButtonView(isSelected: message.anonyme, title: "Anonyme") {
                        message.toggleAnonyme()
                    }
                    .padding(.top)
                    Spacer()
                        .frame(height: 40)
                    
                    
                    TextEditor(text: $messageText)
                        .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/) // Set minimum height to allow multiple lines
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color.gray, lineWidth: 1)
                        )
                    
                    Button(action: {
                        if !messageText.isEmpty{
                            message.messageContent(messageContent: messageText)
                            hist.newMessage(message: message)
                            messageSent = true
                        }else{
                            showAlert = true
                        }
                    }, label: {
                        Text("Envoyer")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(width: 200, height: 50)
                            .background(.orangeEdu)
                            .cornerRadius(10)
                    })
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Champ Vide"),
                            message: Text("Le champ de texte ne peut pas être vide."),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                }else if messageSent{
                    Text("Le message a été bien envoyé. Le professeur McDonald vous répondra au plus vite")
                        .transition(.opacity)
                        .animation(.easeInOut(duration: 1.5), value: messageSent)
                    
                }
                
            }
            .padding(20)
            .navigationTitle("Poser une question")
        }
    }
}

#Preview {
    QuestionClassModale(selectedType: .seSensPasBien, message: Message(auteur: User(email: "", mdp: "", name: "", surname: "", mood: Mood(moodIcon: "moodNone"), enCeMoment: EnCeMoment(myMusic: "", myPride: "", myChallenge: "")), destinaire: User(email: "", mdp: "", name: "", surname: "", mood: Mood(moodIcon: "moodNone"), enCeMoment: EnCeMoment(myMusic: "", myPride: "", myChallenge: "")), typeQuestion: .poserQuest, message: ""))
}


struct RadioButtonView: View {
    var isSelected: Bool
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            HStack {
                Image(systemName: isSelected ? "largecircle.fill.circle" : "circle")
                    .foregroundColor(.orangeEdu)
                Text(title)
                    .foregroundStyle(.purpleEdu)
            }
        }
    }
}

//struct RoundedTextFieldStyle: TextFieldStyle {
//    func _body(configuration: TextField<Self._Label>) -> some View {
//        configuration
//            .padding(.horizontal)
//            .padding(.vertical, 10)
//            .background(
//                RoundedRectangle(cornerRadius: 10)
//                    .strokeBorder(Color.gray, lineWidth: 1)
//            )
//    }
//}

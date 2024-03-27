//
//  QuestionHistory.swift
//  TrueClassLinkProject
//
//  Created by Apprenant98 on 12/03/2024.
//

import SwiftUI

struct QuestionHistory: View {
    @ObservedObject var messageHistorique: MessageHistorique
    @State var selected: Bool = false
    var filteredMessages: [Message] {
        if selected {
            // Retourner uniquement les messages de l'auteur spécifié ("Vache Julie").
            return messageHistorique.historique.filter { $0.auteur.name == "Vache" && $0.auteur.surname == "Julie" }
        } else {
            // Retourner les messages qui ont une réponse et ne sont pas anonymes.
            return messageHistorique.historique.filter { $0.response != nil && !$0.anonyme }
        }
    }
    
    
    
    var body: some View {
        NavigationStack{
            ScrollView {
                HStack{
                    Text("Mes messages")
                        .fontWeight(selected ? .bold : .regular)
                        .onTapGesture {
                            self.selected = true
                        }
                    
                    Spacer()
                        .frame(width: 40)
                    
                    Text("Tous les messages")
                        .fontWeight(selected ? .regular : .bold)
                        .onTapGesture {
                            self.selected = false
                        }
                }
                VStack(alignment: .leading, spacing: 16) {
                    
                    ForEach(filteredMessages) { message in
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.orangeEdu)
                        MessageBubbleView(message: message)
                        //                                Rectangle()
                        //                                    .frame(height: 1)
                        //                                    .foregroundColor(.orangeEdu)
                    }
                }
                .padding()
            }
            
            .navigationTitle("Historique des questions")
            //.font(.title)
        }
    }
}



struct MessageBubbleView: View {
    let message: Message
    
    var body: some View {
        VStack{
            
            //            if message.auteur.name == "Vache" && message.auteur.surname == "Julie" {
            HStack {
                
                Spacer()
                Text(message.auteur.name)
                Image("studentPP")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.orange, lineWidth: 2))
            }
            
            //            VStack(alignment: message.auteur.email == "eleve" ? .leading : .leading) {
            Text(message.message)
                .padding()
                .foregroundColor(.white)
                .frame(width:270)
                .background(.orangeEdu)
                .cornerRadius(10)
            
            if let response = message.response {
                HStack{
                    Image("studentPP")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.orange, lineWidth: 2))
                    Text(response.author)
                    Spacer()
                    
                }
                
                Text(response.responseContent)
                    .padding()
                    .foregroundColor(.purpleEdu)
                    .frame(width:270)
                    .background(Color.lightGrayEdu)
                    .cornerRadius(10)
            } else{
                Text("En attente de reponse")
                    .padding()
            }
        }
    }
}




#Preview {
    QuestionHistory(messageHistorique: MessageHistorique())
}

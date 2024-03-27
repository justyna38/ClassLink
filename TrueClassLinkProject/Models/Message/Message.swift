//
//  Message.swift
//  Classes
//
//  Created by Justyna Warzecha on 11/03/2024.
//

import Foundation

enum TypeQuestion: String, CaseIterable {
    case tropVite = "Ca va trop vite"
    case poserQuest = "Poser une q°"
    case seSensPasBien = "Je ne me sens pas bien"
}

struct Response {
    let author: String
    let responseContent: String
}

class Message: ObservableObject , Identifiable{
    @Published var anonyme: Bool = false
    @Published var auteur: User
    @Published var destinaire: User
    @Published var typeQuestion: TypeQuestion
    @Published var message: String
    @Published var response: Response?
    var date: Date = Date.now
    
    init(auteur: User, destinaire: User, typeQuestion: TypeQuestion, message: String, response: Response? = nil) {
        self.auteur = auteur
        self.destinaire = destinaire
        self.typeQuestion = typeQuestion
        self.message = message
        self.response = response
    }
    
    
    func toggleAnonyme() {
        anonyme.toggle()
        print(anonyme)
    }
    
    func setTypeQuestion(type: TypeQuestion){
        self.typeQuestion = type
        print(typeQuestion)
    }
    
    func messageContent(messageContent: String){
        self.message = messageContent
    }
    
    //    func sendMessage(auteur: User, destinaire: User, messageText: String) {
    //           let newMessage = Message(auteur: self.auteur, destinaire: self.destinaire, typeQuestion: self.typeQuestion, message: messageText)
    //           MessageHistorique.shared.newMessage(message: newMessage)
    //        print(newMessage.auteur.name)
    //        print(newMessage.destinaire.name)
    //        print(newMessage.typeQuestion)
    //        print(newMessage.message)
    //        print(newMessage.anonyme)
    //        print(MessageHistorique.shared.historique.count)
    //       }
    
}

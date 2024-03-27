//
//  MessageHistorique.swift
//  Classes
//
//  Created by Justyna Warzecha on 11/03/2024.
//

import Foundation

class MessageHistorique: ObservableObject {
    //static var shared = MessageHistorique()
    var historique: [Message] = []
    
    init() {
        // Création de l'objet Response
        let response = Response(author: "prof", responseContent: "Il faut que tu kzjedkzjenf zefjhzefjh zjefnzkejfnfkj zejfzkefjnfkj")
        let response2 = Response(author: "prof", responseContent: "Il faut que tu kzjedkzjenf zefjhzefjh zjefnzkejfnfkj zejfzkefjnfkj")
        let response3 = Response(author: "prof", responseContent: "Il faut que tu kzjedkzjenf zefjhzefjh zjefnzkejfnfkj zejfzkefjnfkj")
//        let response4 = Response(author: "prof", responseContent: "Il faut que tu kzjedkzjenf zefjhzefjh zjefnzkejfnfkj zejfzkefjnfkj")
        
        // Création de l'objet Message avec la réponse et ajout à l'historique
        let messageWithResponse1 = Message(auteur: User(email: "eleve", mdp: "osef", name: "Vache", surname: "Julie", mood: Mood(moodIcon: "moodNone"), enCeMoment: EnCeMoment(myMusic: "", myPride: "", myChallenge: "")), destinaire: User(email: "prof", mdp: "osef", name: "Perrot", surname: "Amélie", mood: Mood(moodIcon: "moodNone"), enCeMoment: EnCeMoment(myMusic: "", myPride: "", myChallenge: "")), typeQuestion: .poserQuest, message: "Je voudrais savoir si je peux avoir plus d'éclaircissement sur le dernier point de cours", response: response)
        let messageWithResponse2 = Message(auteur: User(email: "pierre", mdp: "osef", name: "Coupe", surname: "Olga", mood: Mood(moodIcon: "moodNone"), enCeMoment: EnCeMoment(myMusic: "", myPride: "", myChallenge: "")), destinaire: User(email: "prof", mdp: "osef", name: "Perrot", surname: "Amélie", mood: Mood(moodIcon: "moodNone"), enCeMoment: EnCeMoment(myMusic: "", myPride: "", myChallenge: "")), typeQuestion: .poserQuest, message: "Je voudrais savoir si je peux avoir plus d'éclaircissement sur le dernier point de cours", response: response2)
        let messageWithResponse3 = Message(auteur: User(email: "eleve", mdp: "osef", name: "Verrin", surname: "Patricia", mood: Mood(moodIcon: "moodNone"), enCeMoment: EnCeMoment(myMusic: "", myPride: "", myChallenge: "")), destinaire: User(email: "prof", mdp: "osef", name: "Perrot", surname: "Amélie", mood: Mood(moodIcon: "moodNone"), enCeMoment: EnCeMoment(myMusic: "", myPride: "", myChallenge: "")), typeQuestion: .poserQuest, message: "Je voudrais savoir si je peux avoir plus d'éclaircissement sur le dernier point de cours", response: response3)
        //        var messageWithResponse4 = Message(auteur: User(email: "eleve", mdp: "osef", name: "Tessin", surname: "Paul"), destinaire: User(email: "prof", mdp: "osef", name: "Perrot", surname: "Amélie"), typeQuestion: .poserQuest, message: "Je voudrais savoir si je peux avoir plus d'éclaircissement sur le dernier point de cours", response: response4)
        //        var messageWithResponse5 = Message(auteur: User(email: "eleve", mdp: "osef", name: "Vache", surname: "Julie"), destinaire: User(email: "prof", mdp: "osef", name: "Perrot", surname: "Amélie"), typeQuestion: .poserQuest, message: "Je voudrais savoir si je peux avoir plus d'éclaircissement sur le dernier point de cours")
        historique.append(messageWithResponse1)
        historique.append(messageWithResponse2)
        historique.append(messageWithResponse3)
        //        historique.append(messageWithResponse5)
        messageWithResponse1.toggleAnonyme()
        
        
    }
    
    
    
    func newMessage(message: Message) -> [Message]{
        self.historique.append(message)
        //        print(message.auteur.email)
        //        print(message.typeQuestion)
        //        print(message.message)
        let messageContent = "\(message.auteur.email): \(message.message)"
        print(messageContent)
        print(historique.count)
        return historique
    }
    
    func countMessageByUtilisateur(){
        var messageUtilisateur: [User] = []
        for hist in historique {
            messageUtilisateur.append(hist.auteur)
            print()
            
        }
    }
    
    
    
}

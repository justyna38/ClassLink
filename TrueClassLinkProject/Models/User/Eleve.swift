//
//  Eleve.swift
//  Classes
//
//  Created by Justyna Warzecha on 11/03/2024.
//

import Foundation

enum PointsForts {
    case travailEquipe (name: String) // "Travail en équipe"
    case apprendreVite (name: String) // "Apprend vite"
    case collaboration (name: String) // "Collaboration"
    case confianceEnSoi (name: String) // "Confiance en soi"
    case motivation (name: String) // "Motivé.e"
    case sociable (name: String) // "Sociable"
    case bonneOrganisation (name: String) // "Bonne organisation"
}
enum PointsFaibles {
    case depression (name: String) // "Dépression"
    case mauvaiseOrganisation (name: String) // "Difficultés à s'organiser"
    case environnementDifficile (name: String) // "Environnement difficile"
    case handicapPhy (name: String) // "Handicap Physique"
    case handicapPsy (name: String) // "Handicap Psychique"
    case harcellement (name: String) // "Harcellé.e"
    case manqueConfiance (name: String) // "Manque de confiance"
}

class Eleve: User {
    
    var classe: Classes
    var pointsForts: [PointsForts]?
    var pointsFaibles: [PointsFaibles]?
    
    init(email: String, mdp: String, name: String, surname: String, classe: Classes) {
        self.classe = classe
        super.init(email: email, mdp: mdp, name: name, surname: surname, mood: Mood(moodIcon: "moodNone"), enCeMoment: EnCeMoment(myMusic: "", myPride: "", myChallenge: ""))
    }
}



//    func creerEleve(email: String, mdp: String, name: String, prenom: String, classe: Classes) -> Eleve? {
//        if email.isEmpty || mdp.isEmpty {
//            print("Veuillez remplir tous les champs.")
//            return nil
//        } else {
//            let newEleve = Eleve(email: email, mdp: mdp, name: name, prenom: prenom, classe: classe)
//            print(newEleve.email)
//            return newEleve
//
//        }
//
//    }

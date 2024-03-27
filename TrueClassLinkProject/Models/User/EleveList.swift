//
//  EleveList.swift
//  Classes
//
//  Created by Justyna Warzecha on 11/03/2024.
//

import Foundation

class EleveList: ObservableObject{
    @Published var listeEleve: [Eleve] = []
    
    
    func addEleve(eleve: Eleve){
        self.listeEleve.append(eleve)
        
    }
    
    
    func creerEleve(email: String, mdp: String, name: String, surname: String, classe: Classes) -> Eleve? {
        if email.isEmpty || mdp.isEmpty || name.isEmpty || surname.isEmpty || classe.name.isEmpty {
            print("Veuillez remplir tous les champs.")
            return nil
        } else {
            let newEleve = Eleve(email: email, mdp: mdp, name: name, surname: surname, classe: classe)
            addEleve(eleve: newEleve)
            print(listeEleve)
            print(newEleve.name)
            print(newEleve.mdp)
            print(newEleve.email)
            print(newEleve.surname)
            print(newEleve.classe.name)
            return newEleve
            
            
        }
        
        
    }
    
    func eleveExists(email: String, mdp: String) -> Bool {
        return listeEleve.contains(where: { $0.email == email && $0.mdp == mdp})
    }
}

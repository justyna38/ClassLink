//
//  Cours.swift
//  Classes
//
//  Created by Justyna Warzecha on 11/03/2024.
//

//Modif Cours (ajouter la classe liste)

import Foundation

class Cours {
    var discipline: Discipline
    var titre: String
    
    init(discipline: Discipline, titre: String) {
        self.discipline = discipline
        self.titre = titre
    }
}

class ListeCours: ObservableObject {
    @Published var cours: [Cours] = []
    
    init() {
        self.cours = [
            Cours(discipline: .francais, titre: "Lit. XVIIIe"),
            Cours(discipline: .francais, titre: "Rousseau et l'éducation"),
            Cours(discipline: .francais, titre: "Le rôle des salons littéraires"),
            Cours(discipline: .francais, titre: "Les figures de style"),
            
            Cours(discipline: .maths, titre: "Probabilités"),
            Cours(discipline: .maths, titre: "Algèbre et géométrie"),
            Cours(discipline: .maths, titre: "Théorèmes de géométrie"),
            Cours(discipline: .maths, titre: "Calcul intégral"),
            
            Cours(discipline: .hist, titre: "Civilisations"),
            Cours(discipline: .hist, titre: "Révolution Francaise"),
            Cours(discipline: .hist, titre: "Emplire Romain"),
            Cours(discipline: .hist, titre: "Mondialisation"),
            Cours(discipline: .hist, titre: "Géopolitique"),
            

            Cours(discipline: .physique, titre: "Mécanique classique"),
            Cours(discipline: .physique, titre: "Thermodynamique"),
            Cours(discipline: .physique, titre: "Ondes et vibrations"),
            Cours(discipline: .physique, titre: "Électromagnétisme"),
            Cours(discipline: .physique, titre: "Physique des particules"),
            Cours(discipline: .angl, titre: "Angl. Scientifique"),
            Cours(discipline: .angl, titre: "Usage du Past Perfect"),
            Cours(discipline: .angl, titre: "Contraste: Past Simple vs Past Perfect"),
            Cours(discipline: .angl, titre: "Pratique du Past Perfect"),
            Cours(discipline: .angl, titre: "Narration au Past Perfect"),
            Cours(discipline: .philo, titre: "Conscience et inconscient"),
            Cours(discipline: .philo, titre: "Philosophie de l'esprit"),
            Cours(discipline: .philo, titre: "Identité personnelle"),
            Cours(discipline: .philo, titre: "Esprit et matière"),
            Cours(discipline: .philo, titre: "Cognition et émotion"),
            Cours(discipline: .eco, titre: "Éco. Durable"),
            Cours(discipline: .eco, titre: "Économie circulaire"),
            Cours(discipline: .eco, titre: "Éco-innovation et technologie verte"),
            Cours(discipline: .eco, titre: "Responsabilité sociale des entreprises"),
            Cours(discipline: .eco, titre: "Transition énergétique"),
            Cours(discipline: .svt, titre: "Génétique"),
            Cours(discipline: .svt, titre: "ADN"),
            Cours(discipline: .svt, titre: "Biotech."),
            Cours(discipline: .svt, titre: "Génétique+Biotech."),
            Cours(discipline: .svt, titre: "Génétique+Biotech.")
        ]
    }
}

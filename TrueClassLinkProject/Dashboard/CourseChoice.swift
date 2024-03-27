//
//  CourseChoice.swift
//  TrueClassLinkProject
//
//  Created by Apprenant98 on 12/03/2024.
//

import SwiftUI

struct CourseChoice: View {
    var hist: MessageHistorique
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    func imageForCourse(cours: Discipline) -> String {
        switch cours.rawValue {
        case "Français":
            return "scroll"
        case "Maths":
            return "sum"
        case "Philo":
            return "brain.head.profile"
        case "Physique-Chimie":
            return "atom"
        case "SVT":
            return "leaf"
        case "Histoire-Géo":
            return "globe"
        case "Eco":
            return "chart.bar"
        case "Anglais":
            return "character.book.closed"
            
        default:
            return "defaultImage"
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("backgroundBase")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
                
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(Discipline.allCases, id: \.self) { cours in
                        NavigationLink(destination: CoursView(coursName: cours.rawValue, hist: hist)) {
                            let image = imageForCourse(cours: cours)
                            OrangeBigButton(text: cours.rawValue, imageName: image)
                        }
                    }
                }
                .padding(.horizontal) // Ajoute un peu d'espace sur les côtés si nécessaire
            }
        }
    }
}

#Preview {
    CourseChoice(hist: MessageHistorique())
}




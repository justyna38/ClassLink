//
//  QuestionLibre.swift
//  TrueClassLinkProject
//
//  Created by Apprenant 46 on 19/03/2024.
//

import SwiftUI

struct QuestionLibre: View {
    @State var presentedQuestion: String = ""
    @State var finalQuestion: String = ""
    @State var showAnswers: Bool
    
    var body: some View {
        
        ZStack {
            Image("backgroundBase")
                .resizable()
                .ignoresSafeArea()
            
            VStack(alignment: .center) {
                
                if showAnswers == false {
                    TextField("Quelle est votre question ?", text: $presentedQuestion, onCommit: {
                        finalQuestion = presentedQuestion
                        showAnswers = true
                    })
                    .font(.title2)
                    .frame(width: 300)
                    .padding(.leading, 40)
                    .padding(.top, 80)
                    .padding(.bottom, 40)
                    
                    Button(action: {
                        showAnswers.toggle()
                    }, label: {
                        Text("Valider")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(width: 200, height: 50)
                            .background(.orangeEdu)
                            .cornerRadius(30)
                    })
                } else {
                    Text(finalQuestion)
                        .font(.title2)
                        .foregroundStyle(.orangeEdu)
                        .multilineTextAlignment(.center)
                        .padding(.top, 50)
                        .padding(.bottom, 30)
                    
                    ScrollView {
                        
                        ForEach(freeQuestionAnswers) { freeQuestionAnswer in
                            VStack {
                                Text(freeQuestionAnswer.eleve)
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.orangeEdu)
                                Text(freeQuestionAnswer.answer)
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.purpleEdu)
                            }
                            .padding(5)
                }
                
               
                        
                    }
                }
            }
        }
    }
}

struct FreeQuestionAnswer: Identifiable {
    let id = UUID()
    let eleve: String
    let answer: String
}

var freeQuestionAnswers = [
    FreeQuestionAnswer(eleve: "Annaël Arzel", answer: "La guerre entre les Russes et les Turcs"),
    FreeQuestionAnswer(eleve: "Alex Albouy", answer: "expedition de vasili zagyrev"),
    FreeQuestionAnswer(eleve: "Leila Abadi", answer: "Première guerre mondiale"),
    FreeQuestionAnswer(eleve: "Fatima Ali", answer: "la révolution russe"),
    FreeQuestionAnswer(eleve: "Karim Abbas", answer: "fin de l'esclavage des paysans"),
    FreeQuestionAnswer(eleve: "Anthony Begarden", answer: "guerre des russes et des Turcs"),
    FreeQuestionAnswer(eleve: "Bejamin Borellat", answer: "construction du train sibérien"),
    FreeQuestionAnswer(eleve: "Wei Chen", answer: "la révolution russe"),
    FreeQuestionAnswer(eleve: "Damien Dasilva", answer: "révolution russe"),
    FreeQuestionAnswer(eleve: "Bertrand DiMartino", answer: "la révolution russe"),
    FreeQuestionAnswer(eleve: "Sarah Dubois", answer: "révolution des russes"),
    FreeQuestionAnswer(eleve: "Nadia Farelli", answer: "Expédition de vasili ou vasile ?"),
    FreeQuestionAnswer(eleve: "Maëlys Fernandez", answer: "Première guerre mondiale"),
    FreeQuestionAnswer(eleve: "Diego Garcia", answer: "la guerre mondiale"),
    FreeQuestionAnswer(eleve: "Kylian Garcia", answer: "je sais pas"),
    FreeQuestionAnswer(eleve: "Maya Gupti", answer: "fin du servage"),
    FreeQuestionAnswer(eleve: "Nour Hamadi", answer: "Expédition de vasili rayev"),
    FreeQuestionAnswer(eleve: "Amir Hussein", answer: "La révolution russe"),
    FreeQuestionAnswer(eleve: "David Kim", answer: "construction du trainsibérien"),
    FreeQuestionAnswer(eleve: "Natasha Kowalczyk", answer: "révolution russe"),
    FreeQuestionAnswer(eleve: "Angélique Lopez", answer: "le transibérien"),
    FreeQuestionAnswer(eleve: "Raphaël Martinez", answer: "Je sais pas"),
    FreeQuestionAnswer(eleve: "Elena Nguyen", answer: "révolution russe"),
    FreeQuestionAnswer(eleve: "Enzo Park", answer: "révolution russe"),
    FreeQuestionAnswer(eleve: "Ayaan Pasquet", answer: "je ne sais pas désolé"),
    FreeQuestionAnswer(eleve: "Jasmine Patel", answer: "guerre des russes et les turcs"),
    FreeQuestionAnswer(eleve: "Anna Petrova", answer: "fin des cerfs"),
    FreeQuestionAnswer(eleve: "Maria Santos", answer: "guerre des russes et des turcs"),
    FreeQuestionAnswer(eleve: "Leonardo Rodriguez", answer: "guerre des russes"),
    FreeQuestionAnswer(eleve: "Luca Rossi", answer: "J'ai oublié"),
    FreeQuestionAnswer(eleve: "Marin Silva", answer: "la révolution"),
    FreeQuestionAnswer(eleve: "Mélanie Wong", answer: "la révolution des russes")
]
    
    



#Preview {
    QuestionLibre(showAnswers: false)
}

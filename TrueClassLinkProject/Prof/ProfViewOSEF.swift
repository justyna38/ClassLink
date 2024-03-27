//
//  PageProfilComplete.swift
//  TrueClassLinkProject
//
//  Created by Apprenant 46 on 19/03/2024.
//

import SwiftUI

struct ProfQuestionsView: View {
    var body: some View {
        NavigationView {
            ProfQuestionView()
                .navigationBarTitle("Poser une question")
        }
    }
}

struct ProfQuestionView: View {
    @State private var currentIndex = 0
    private let colors: [Color] = [.white, .white]
    
    var body: some View {
        
        ZStack {
            Image("backgroundBase")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                NavigationLink(destination: CheckRythme(seeResult: false)) {
                    Text("Vérifier le rytme")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(width: 200, height: 50)
                        .background(.orangeEdu)
                        .cornerRadius(30)
                        .padding(.bottom, 30)
                }
                
                NavigationLink(destination: QuestionLibre(showAnswers: false)) {
                    Text("Poser une question")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(width: 200, height: 50)
                        .background(.orangeEdu)
                        .cornerRadius(30)
                        .padding(.bottom, 30)
                }
                
                NavigationLink(destination: QuestionsPreparees()) {
                    Text("Questions préparées")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(width: 200, height: 50)
                        .background(.orangeEdu)
                        .cornerRadius(30)
                        .padding(.bottom, 80)
                }
                
                NavigationLink(destination: QuestionsEleves()) {
                    Text("Questions d'élèves")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(width: 200, height: 50)
                        .background(.purpleEdu)
                        .cornerRadius(30)
                        .padding(.bottom, 50)
                }
                
        
            }
            
            
            
        }
        
    }
}
        

#Preview {
    ProfQuestionsView()
}

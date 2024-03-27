//
//  QuestionsPreparees.swift
//  TrueClassLinkProject
//
//  Created by Apprenant 46 on 19/03/2024.
//

import SwiftUI

struct QuestionsPreparees: View {
    var body: some View {
        ZStack {
            Image("backgroundBase")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Text("Quel quiz souhaitez-vous lancer ?")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.orangeEdu)
                    .padding(.top, 60)
                    .padding(.bottom, 150)
                
                NavigationLink(destination: QuizRevolution(showResults: false)) {
                    Text("La révolution russe")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(width: 200, height: 50)
                        .background(.orangeEdu)
                        .cornerRadius(30)
                        .padding(.bottom, 50)
                }
                
                Text("La chute des empires centraux")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(width: 200, height: 60)
                    .background(.orangeEdu)
                    .cornerRadius(30)
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
            
            
        }
    }
}

#Preview {
    QuestionsPreparees()
}

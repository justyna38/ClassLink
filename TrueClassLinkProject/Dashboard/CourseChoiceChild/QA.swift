//
//  FrenchQA.swift
//  TrueClassLinkProject
//
//  Created by Apprenant65 on 15/03/2024.
//

import SwiftUI

struct QA: View {
    var coursName: String
    var body: some View {
        ZStack{
            Image("backgroundBase")
                .resizable()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .scaledToFill()
            
            VStack{
                Text("\(coursName) Q&A")
                    .bold()
                    .font(.custom("SFPro-bold", size: 33))
                    .padding(.bottom, 530)
                    .foregroundStyle(.orangeEdu)
            }
            
            VStack {
                ButtonAnswer(question: "A quand est reporté le prochain cours ? \r", answer: "Nous n'avons pas encore de date")
                    .frame(width: 330, height: 220)
                    .padding(.top, 100)
                
                ButtonAnswer(question: "Je n'étais pas là au dernier cours, qu'est-ce que vous avez vu ? \r", answer: "Les mouvements littéraire. Dans les ressources il y a un lien qui te redirige vers un site.")
                    .frame(width: 330, height: 220)
                    .padding(.bottom, 10)
                
            }
        }
    }
    
    struct ButtonAnswer: View {
        let question: String
        let answer: String
        
        var body: some View {
            VStack {
                Text(question)
                    .fontWeight(.bold) // Mettre uniquement la question en gras
                    .font(.system(size: 20))
                Text(answer)
                    .font(.custom("SFPro-bold", size: 20))
            }
            .padding()
            .background(.greyEdu)
            .contrast(2.5)
            .foregroundColor(.black)
            .cornerRadius(10)
        }
    }
}




#Preview {
    QA(coursName: "Français")
    
}

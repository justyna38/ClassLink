//
//  CoursView.swift
//  TrueClassLinkProject
//
//  Created by Justyna Warzecha on 19/03/2024.
//

import SwiftUI

struct CoursView: View {
    var coursName: String
    var hist: MessageHistorique
    //var message: Message
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("backgroundBase")
                    .resizable()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .scaledToFill()
                VStack{
                    NavigationLink(destination: QuestionHistory(messageHistorique: hist)){
                        NonFilledOrangeButton(text: "Historique ", imageButton: Image(systemName: "doc.questionmark"))
                            .fontWeight(.semibold)
                            .font(.custom("SFPro-bold", size: 23))
                        
                    }
                    .padding(.top, 10)
                    NavigationLink(destination: RessourcesView(courseName: coursName)){
                        NonFilledOrangeButton(text: "Cours ", imageButton: Image(systemName: "book"))
                            .fontWeight(.semibold)
                            .font(.custom("SFPro-bold", size: 23))
                    }
                    .padding(.top, 10)
                    NavigationLink(destination: QA(coursName: coursName)){
                        NonFilledOrangeButton(text: "Q&A ", imageButton: Image(systemName: "questionmark.bubble"))
                            .fontWeight(.semibold)
                            .font(.custom("SFPro-bold", size: 23))
                    }
                    .padding(.top, 10)
                    NavigationLink(destination: Profile()){
                        NonFilledOrangeButton(text: "Profil de Mme Martin ", imageButton: Image(systemName: "person.crop.circle"))
                            .fontWeight(.light)
                            .fontWeight(.semibold)
                            .font(.custom("SFPro-bold", size: 23))
                    }
                    .padding(.top, 10)
                }
            }
            
        }
        .navigationTitle(coursName)
        
    }
}

#Preview {
    CoursView(coursName: "sf", hist: MessageHistorique())
}

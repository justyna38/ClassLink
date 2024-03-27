//
//  RessourcesView.swift
//  TrueClassLinkProject
//
//  Created by Apprenant98 on 12/03/2024.
//
// Modification de la logique d'affichage des cours dynamiquement

import SwiftUI




struct RessourcesView: View {
    var courseName: String
    @ObservedObject var lescours: ListeCours = ListeCours()
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("backgroundBase")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
                ScrollView{
                VStack{
//                    Text(courseName)
//                        .fontWeight(.medium)
//                        .bold()
//                        .font(.custom("SFPro-bold", size: 30))
                    
                        // Filtrer et afficher les cours correspondants
                        ForEach(lescours.cours.filter { $0.discipline.rawValue == courseName }, id: \.titre) { coursFiltre in
                            OrangeBigButton2(text: coursFiltre.titre, imageButton: Image(systemName: "book.fill"))
                                .padding(.top, 10)
                                .foregroundStyle(.white)
                        }
                    }
                }
               .padding(.top, 80)
            }
        }
    }
}


#Preview {
    RessourcesView(courseName: "SVT")
}

struct OrangeBigButton2: View, Identifiable  {
    var id = UUID()
    let text: String
    let imageButton: Image
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 230, height: 140)
                .foregroundColor(.orangeEdu)
                .clipShape(RoundedRectangle(cornerRadius: 16.0))
                .overlay(
                    RoundedRectangle(cornerRadius: 16.0)
                        .stroke(Color.orangeEdu, lineWidth: 2)
                )
            
            VStack {
                Rectangle()
                    .frame(width: 90, height: 50)
                    .foregroundColor(.yellowEdu)
                    .clipShape(.rect(topLeadingRadius: 0, bottomLeadingRadius: 16, bottomTrailingRadius: 0, topTrailingRadius: 16))
                    .offset(x: 70, y: 10)
                
                imageButton
                    .resizable()
                    .frame(width: 30, height: 30)
                    .offset(x: -45)
                
                Text(text)
                    .foregroundColor(.white)
                    .offset(x: 30)
                    .fontWeight(.semibold)
                    .font(.custom("SFPro-bold", size: 23))
                    .padding(.bottom, 15)
                    .multilineTextAlignment(.leading)
            }
            
        }
    }
}

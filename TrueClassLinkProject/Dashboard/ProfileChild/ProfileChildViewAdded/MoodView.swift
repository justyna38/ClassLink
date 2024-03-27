//
//  MoodView.swift
//  TrueClassLinkProject
//
//  Created by Apprenant 46 on 18/03/2024.
//

import SwiftUI

struct MoodView: View {
    @Binding var profileEditMode:Bool
    @ObservedObject var eleve: Eleve
    @State var showingMoodsList:Bool
    
    var body: some View {
        if profileEditMode == true {
            Button(action: {
                showingMoodsList.toggle()
            }, label: {
                ZStack {
                    Image(eleve.mood.moodIcon)
                        .resizable()
                        .frame(width: 120, height: 120)
                        .rotationEffect(.degrees(20))
                    .padding(.leading, 200)
                    ZStack {
                        Circle()
                            .frame(width: 35)
                        .foregroundStyle(.greyEdu)
                        Image(systemName: "xmark.circle")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundStyle(.white)
                    }
                    .offset(x: 140, y: -30)
                }
            })
            .sheet(isPresented: $showingMoodsList, content: {
                MoodsList(eleve: eleve)
            })
        } else {
            ZStack {
                Image(eleve.mood.moodIcon)
                    .resizable()
                    .frame(width: 120, height: 120)
                    .rotationEffect(.degrees(20))
                .padding(.leading, 200)
               
                
            }
           
        }
    }
}

#Preview {
    MoodView(profileEditMode: .constant(true), eleve: studentProfiles[0], showingMoodsList: false)
}

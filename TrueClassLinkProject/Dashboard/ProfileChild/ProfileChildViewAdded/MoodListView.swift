//
//  MoodListView.swift
//  TrueClassLinkProject
//
//  Created by Apprenant 46 on 18/03/2024.
//

import SwiftUI
    
    struct MoodsList: View {
        @Environment(\.dismiss) var dismiss
        @ObservedObject var eleve: Eleve
        
        var body: some View {
            ScrollView {
                ZStack {
                    Rectangle()
                        .frame(width: 340, height: 500)
                        .foregroundColor(.lightGrayEdu)
                        .cornerRadius(16)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    VStack {
                            LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 5) {
                                ForEach(moods) { mood in
                                    Button(action: {
                                        eleve.mood.moodIcon = mood.moodIcon
                                        dismiss()
                                    }, label: {
                                        VStack {
                                            Image(mood.moodIcon)
                                                .resizable()
                                                .font(.caption2)
                                                .frame(width: 50, height: 50)
                                        }
                                        .padding(.bottom, 20)
                                    })
                                }
                            }
                            .padding(.bottom, 20)
                        Button(action: {
                            dismiss()
                        }, label: {
                            Text("Annuler")

                        }
                        )
                        
//                        Button(action: {
//                            dismiss()
//                        }, label: {
//                            Text("Fermer")
//                                .foregroundColor(.white)
//                                .font(.headline)
//                                .frame(width: 150, height: 50)
//                                .background(.greyEdu)
//                                .cornerRadius(30)
//                        })
                    }
                }
            }
        }
    }


#Preview {
    MoodsList(eleve: studentProfiles[0])
}

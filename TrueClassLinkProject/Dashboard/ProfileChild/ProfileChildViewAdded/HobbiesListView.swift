//
//  SwiftUIView.swift
//  ClassLinkProject
//
//  Created by Apprenant 46 on 11/03/2024.
//


import SwiftUI

struct AddHobbiesIcon: View {
    @Binding var profileEditMode: Bool
    @State var showingHobbiesList:Bool
    @ObservedObject var eleve: Eleve
    
    var body: some View {
            
            if profileEditMode == false {
                //vide: ne s'affiche pas
            } else if profileEditMode == true {
                Button(action: {
                    showingHobbiesList.toggle()
                }, label: {
                    ZStack {
                        Circle()
                            .frame(width: 30)
                            .foregroundStyle(.purpleEdu)
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.white)
                    }
                }
                )
                .sheet(isPresented: $showingHobbiesList, content: {
                    HobbiesList(eleve: eleve)
                })
                
            }
            
            
        }
    }
    
    struct HobbiesList: View {
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
                        let count = eleve.countHobby(countedHobby: eleve.hobby)
                        if count < 6 {
                            LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 5) {
                                ForEach(hobbies) { hobby in
                                    Button(action: {
                                        _ = eleve.addHobby(oneHobby: hobby)
                                        
                                    }, label: {
                                        VStack {
                                            Image(systemName: hobby.hobbyIcon)
                                                .foregroundStyle(.purpleEdu)
                                            Text(hobby.hobbyName)
                                                .fontWeight(.light)
                                                .font(.caption2)
                                                .multilineTextAlignment(.center)
                                                .foregroundStyle(.purpleEdu)
                                                .frame(width: 60)
                                        }
                                        .padding(.bottom, 20)
                                    })
                                }
                            }
                            .padding(.bottom, 20)
                        }
                        else if count > 5 {
                            Text("Tu ne peux pas afficher plus de 6 hobbies")
                                .font(.title)
                                .foregroundStyle(.purpleEdu)
                                .multilineTextAlignment(.center)
                                .frame(width: 300, height: 500)
                        }
                        
                        Button(action: {
                            dismiss()
                        }, label: {
                            Text("Fermer")
                                .foregroundColor(.white)
                                .font(.headline)
                                .frame(width: 150, height: 50)
                                .background(.greyEdu)
                                .cornerRadius(30)
                        })
                    }
                }
            }
        }
    }


#Preview {
    AddHobbiesIcon(profileEditMode: .constant(true), showingHobbiesList: false, eleve: studentProfiles[0])
}

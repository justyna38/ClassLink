//
//  ProfileInfosRectangleView.swift
//  TrueClassLinkProject
//
//  Created by Apprenant 46 on 15/03/2024.
//

import SwiftUI

struct ProfileHobbiesRectangle: View {
    @Binding var profileEditMode: Bool
    @ObservedObject var eleve: Eleve
    let numberOfIcons = 3 // Data : Remplacer par le nombre de loisirs
    
    var body: some View {
        VStack(alignment: .center) {
            Rectangle()
                .frame(width: 330, height: 1)
                .padding(.bottom, 5)
                .foregroundStyle(.purpleEdu)
                ZStack {
                    RoundedRectangle(cornerRadius: 15.0)
                        .frame(width: 330, height: 150)
                        .foregroundStyle(.greyEdu)
                        .opacity(0.2)
                    
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 5) {
                        ForEach(eleve.hobby, id: \.self) { hobby in
                            if profileEditMode == false {
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
                                .padding(.bottom, 2)
                            } else {
                                Button(action: {
                                    _ = eleve.removeOne(removedHobby: hobby)
                                }, label: {
                                    ZStack {
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
                                        .padding(.bottom, 2)
                                        ZStack {
                                            Circle()
                                                    .frame(width: 30)
                                                .foregroundStyle(.greyEdu)
                                            Image(systemName: "xmark.circle")
                                                .resizable()
                                                .frame(width: 25, height: 25)
                                                .foregroundStyle(.white)
                                        }
                                        .offset(x: 20, y: -20)
                                            
                                    }
                                    
                                })
                            }
                            
                        }
                        .padding(.bottom, 5)
                        
                        
                        }
                    .padding(.vertical, 20)
                    }
                .frame(width: 330, height: 150)
                
            if profileEditMode == true {
                AddHobbiesIcon(profileEditMode: $profileEditMode, showingHobbiesList: false, eleve: eleve)
                }
            }
        }
    }


#Preview {
    ProfileHobbiesRectangle(profileEditMode: .constant(true), eleve: studentProfiles[0])
}

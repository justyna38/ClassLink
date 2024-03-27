//
//  PageProfilDiagnostic.swift
//  TrueClassLinkProject
//
//  Created by Apprenant 46 on 19/03/2024.
//

import SwiftUI

struct PageProfilDiagnostic: View {
    @State var profileEditMode: Bool
    @State var profilePictureExists: Bool
    @ObservedObject var eleve: Eleve
    
    var ownProfile: Bool = true
    
    var body: some View {
        
            VStack(alignment: .center) {
                HStack {
                    ProfilePicture(profileEditMode: $profileEditMode, profilePictureExists: $profilePictureExists)
                    ProfileText()
                        .padding(.leading, 10)

                    } //Tête de profil
                .padding(.vertical, 30)
               
                ScrollView {
                    
                Text("Motivations")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.orangeEdu)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, -5)
                Rectangle()
                    .frame(width: 330, height: 1)
                    .padding(.bottom, 5)
                .foregroundStyle(.purpleEdu)
               
                
                    ZStack {
                        RoundedRectangle(cornerRadius: 15.0)
                            .frame(width: 330, height: 250)
                            .foregroundStyle(.greyEdu)
                            .opacity(0.2)
                        Image("chartMotivations")
                            .resizable()
                            .frame(width: 300, height: 220)
                    }
                    .padding(.bottom, 30)
                    
                    Text("Difficultés")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.orangeEdu)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, -5)
                    Rectangle()
                        .frame(width: 330, height: 1)
                        .padding(.bottom, 5)
                    .foregroundStyle(.purpleEdu)
                   
                    
                        ZStack {
                            RoundedRectangle(cornerRadius: 15.0)
                                .frame(width: 330, height: 250)
                                .foregroundStyle(.greyEdu)
                                .opacity(0.2)
                            Image("chartDifficulties")
                                .resizable()
                                .frame(width: 300, height: 220)
                        }
                        .padding(.bottom, 30)
                    
                    Text("Points forts")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.orangeEdu)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, -5)
                    Rectangle()
                        .frame(width: 330, height: 1)
                        .padding(.bottom, 5)
                    .foregroundStyle(.purpleEdu)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 15.0)
                            .frame(width: 330, height: 100)
                            .foregroundStyle(.greyEdu)
                            .opacity(0.2)
                        VStack {
                            HStack {
                                Image(systemName: "person.2.fill")
                                    .foregroundStyle(.purpleEdu)
                                Text("Travail en équipe")
                                    .foregroundStyle(.purpleEdu)
                                Spacer()
                            }
                            .padding(.leading, 50)
                            HStack{
                                Image(systemName: "crown.fill")
                                    .foregroundStyle(.purpleEdu)
                                Text("Confiance en soi")
                                    .foregroundStyle(.purpleEdu)
                                Spacer()
                            }
                            .padding(.leading, 50)
                            HStack{
                                Image(systemName: "bubble.left.and.text.bubble.right.fill")
                                    .foregroundStyle(.purpleEdu)
                                Text("Sociable")
                                    .foregroundStyle(.purpleEdu)
                                Spacer()
                            }
                            .padding(.leading, 50)
                        }
                        
                    }
                    
                    Text("Pistes d'amélioration")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.orangeEdu)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, -5)
                    Rectangle()
                        .frame(width: 330, height: 1)
                        .padding(.bottom, 5)
                    .foregroundStyle(.purpleEdu)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 15.0)
                            .frame(width: 330, height: 100)
                            .foregroundStyle(.greyEdu)
                            .opacity(0.2)
                        VStack {
                            HStack {
                                Image(systemName: "person.2.fill")
                                    .foregroundStyle(.purpleEdu)
                                Text("Difficultés à s'organiser")
                                    .foregroundStyle(.purpleEdu)
                                Spacer()
                            }
                            .padding(.leading, 50)
                            HStack{
                                Image(systemName: "crown.fill")
                                    .foregroundStyle(.purpleEdu)
                                Text("Environnement difficile")
                                    .foregroundStyle(.purpleEdu)
                                Spacer()
                            }
                            .padding(.leading, 50)
                        }
                        
                    }
                    
                }
                
                Button(action: {
                    // navigation vers diagnostic
                }, label: {
                    ZStack {
                        Rectangle()
                            .frame(width: 250, height: 40)
                            .foregroundStyle(.orangeEdu)
                            .cornerRadius(10)
                        Text("Faire un nouveau diagnostic")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                    }
                })
                .padding(.top)
                
                Spacer()
                }
               
            
            
            }
        }

#Preview {
    PageProfilDiagnostic(profileEditMode: false, profilePictureExists: true, eleve: studentProfiles[0])
}

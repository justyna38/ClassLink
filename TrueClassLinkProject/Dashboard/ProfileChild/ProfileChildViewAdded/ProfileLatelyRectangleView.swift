//
//  ProfileLatelyRectangleView.swift
//  TrueClassLinkProject
//
//  Created by Apprenant 46 on 18/03/2024.
//

import SwiftUI

struct ProfileLatelyRectangleView: View {
    @Binding var profileEditMode: Bool
    @ObservedObject var eleve: Eleve
    @State var showingAlert: Bool
    @State var presentedTextMusic = ""
    @State var presentedTextProud = ""
    @State var presentedTextChallenge = ""
    
    var body: some View {
        VStack(alignment: .center) {
            Rectangle()
                .frame(width: 330, height: 1)
                .padding(.bottom, 5)
                .foregroundStyle(.purpleEdu)
            ZStack {
                RoundedRectangle(cornerRadius: 15.0)
                    .frame(width: 330, height: 100)
                    .foregroundStyle(.greyEdu)
                    .opacity(0.2)
                
                VStack(alignment: .leading) {
                        HStack {
                            if profileEditMode && eleve.enCeMoment.myMusic == "" {
                            Image(systemName: "music.quarternote.3")
                                .foregroundStyle(.greyEdu)
                                TextField("Une chanson à conseiller ?", text: $presentedTextMusic, onCommit: {
                                    eleve.enCeMoment.myMusic = presentedTextMusic
                                })
                            .foregroundStyle(.purpleEdu)
                                Spacer()
                            } else if profileEditMode && eleve.enCeMoment.myMusic != "" {
                            Image(systemName: "music.quarternote.3")
                                    .foregroundStyle(.purpleEdu)
                                TextField("Une chanson à conseiller ?", text: $presentedTextMusic, onCommit: {
                                    eleve.enCeMoment.myMusic = presentedTextMusic
                                })
                            .foregroundStyle(.purpleEdu)
                                Spacer()
                    } else if profileEditMode == false && eleve.enCeMoment.myMusic == "" {
                            Image(systemName: "music.quarternote.3")
                                .foregroundStyle(.purpleEdu)
                            Text("Pas de musique à conseiller" )
                                .foregroundStyle(.purpleEdu)
                                .font(.headline)
                                .fontWeight(.light)
                        Spacer()
                    } else if profileEditMode == false && eleve.enCeMoment.myMusic != "" {
                        Image(systemName: "music.quarternote.3")
                            .foregroundStyle(.purpleEdu)
                        Text("\(eleve.enCeMoment.myMusic)")
                            .foregroundStyle(.purpleEdu)
                            .font(.headline)
                            .fontWeight(.light)
                        Spacer()
                    }
                    } //music
                        .padding(.leading, 50)
                        .padding(.bottom,5)
                    
                    HStack {
                        if profileEditMode && eleve.enCeMoment.myPride == "" {
                        Image(systemName: "crown.fill")
                            .foregroundStyle(.greyEdu)
                            TextField("Quoi de neuf ?", text: $presentedTextProud, onCommit: {
                                eleve.enCeMoment.myPride = presentedTextProud
                            })
                        .foregroundStyle(.purpleEdu)
                            Spacer()
                        } else if profileEditMode && eleve.enCeMoment.myPride != "" {
                        Image(systemName: "crown.fill")
                            .foregroundStyle(.purpleEdu)
                            TextField("Quoi de neuf ?", text: $presentedTextProud, onCommit: {
                                eleve.enCeMoment.myPride = presentedTextProud
                            })
                        .foregroundStyle(.purpleEdu)
                            Spacer()
                } else if profileEditMode == false && eleve.enCeMoment.myPride == "" {
                        Image(systemName: "crown.fill")
                            .foregroundStyle(.purpleEdu)
                        Text("Rien à signaler" )
                            .foregroundStyle(.purpleEdu)
                            .font(.headline)
                            .fontWeight(.light)
                    Spacer()
                } else if profileEditMode == false && eleve.enCeMoment.myPride != "" {
                    Image(systemName: "crown.fill")
                        .foregroundStyle(.purpleEdu)
                    Text("\(eleve.enCeMoment.myPride)")
                        .foregroundStyle(.purpleEdu)
                        .font(.headline)
                        .fontWeight(.light)
                    Spacer()
                }
                } //proud
                    .padding(.leading, 50)
                    .padding(.bottom,5)
                    
                    HStack {
                        if profileEditMode && eleve.enCeMoment.myChallenge == "" {
                        Image(systemName: "target")
                            .foregroundStyle(.greyEdu)
                            TextField("Chaque chose en son temps", text: $presentedTextChallenge, onCommit: {
                                eleve.enCeMoment.myChallenge = presentedTextChallenge
                            })
                        .foregroundStyle(.purpleEdu)
                            Spacer()
                        } else if profileEditMode && eleve.enCeMoment.myChallenge != "" {
                        Image(systemName: "target")
                            .foregroundStyle(.purpleEdu)
                            TextField("\(eleve.enCeMoment.myChallenge)", text: $presentedTextChallenge, onCommit: {
                                eleve.enCeMoment.myChallenge = presentedTextChallenge
                            })
                        .foregroundStyle(.purpleEdu)
                            Spacer()
                } else if profileEditMode == false && eleve.enCeMoment.myChallenge == "" {
                        Image(systemName: "target")
                            .foregroundStyle(.purpleEdu)
                        Text("Chaque chose en son temps" )
                            .foregroundStyle(.purpleEdu)
                            .font(.headline)
                            .fontWeight(.light)
                    Spacer()
                } else if profileEditMode == false && eleve.enCeMoment.myChallenge != "" {
                    Image(systemName: "target")
                        .foregroundStyle(.purpleEdu)
                    Text("\(eleve.enCeMoment.myChallenge)")
                        .foregroundStyle(.purpleEdu)
                        .font(.headline)
                        .fontWeight(.light)
                    Spacer()
                }
                } //proud
                    .padding(.leading, 50)
                    .padding(.bottom,5)
                }
                
            }
        }
    }
}
    
#Preview {
    ProfileLatelyRectangleView(profileEditMode: .constant(true), eleve: studentProfiles[0], showingAlert: false)
}

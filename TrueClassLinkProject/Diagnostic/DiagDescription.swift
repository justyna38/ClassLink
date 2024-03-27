//
//  DiagDescription.swift
//  TrueClassLinkProject
//
//  Created by Apprenant98 on 12/03/2024.
//

import SwiftUI

struct DiagDescription: View {
    
    @State private var isPressed = false
    @State private var isHovered = false
    var hist: MessageHistorique
    var mess: Message
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("backgroundBase")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    ZStack{
                        Rectangle()
                            .frame(width:340, height:100)
                            .foregroundStyle(Color.orangeEdu)
                            .cornerRadius(15.0)
                        Text("Diagnostic de positionnement")
                            .font(.custom("SFPro-bold", size: 24))
                            .foregroundStyle(.white)
                    }.padding(.top,130)
                    
                    VStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                            //                        création d'un rectangle invisible
                                .foregroundColor(Color.clear)
                                .frame(width:340)
                            
                                .overlay {
                                    VStack(alignment: .leading, spacing: 10) {
                                        Text("Sais-tu à quoi sert ce Diag?")
                                            .font(.custom("SFPro-bold", size: 18))
                                            .foregroundStyle(.orangeEdu)
                                        Spacer().frame(height:20)
                                        
                                        Text("Si tu veux évaluer tes")
                                            .font(.custom("SFPro-Regular", size: 16))
                                            .foregroundStyle(.black)
                                        Text(" forces et faiblesses")
                                            .font(.custom("SFPro-Bold", size: 16))
                                            .foregroundStyle(.orangeEdu)
                                        Text(" et mieux comprendre tes")
                                            .font(.custom("SFPro-Regular", size: 16))
                                            .foregroundStyle(.black)
                                        Text(" motivations")
                                            .font(.custom("SFPro-Bold", size: 16))
                                            .foregroundStyle(.orangeEdu)
                                        Text(", tes compétences, tes besoins éducatifs et tes intérêts, pour faciliter tes choix académiques et professionnels de manière éclairée, alors participe à ce test.")
                                            .font(.custom("SFPro-Regular", size: 16))
                                            .foregroundStyle(.black)
                                        
                                        Text("C’est simple, réponds aux questions dans différentes rubriques, tu peux cocher plusieurs réponses à une question. N’oublie pas de valider tes choix pour changer de rubrique.")
                                            .font(.custom("SFPro-Regular", size: 16))
                                            .foregroundStyle(.black)
                                        Text("Alors maximise ta réussite car ce Diag te permettra d’avoir une vision complète de tes compétences et de bénéficier d’un soutien personnalisé !")
                                            .font(.custom("SFPro-Regular", size: 16))
                                            .foregroundStyle(.black)
                                    }
                                    .padding()
                                }
                        }
                        
                        Spacer()
                        //                    Espace avant le bouton
                        Button(action: {
                            
                            // Action lorsque le bouton est cliqué
                            
                        }) {
                            
                            NavigationLink(destination: DiagMotivation(mess: mess, hist: hist)){
                                ZStack{
                                    RoundedRectangle(cornerRadius: 50.0)
                                        .frame(width: 236, height: 60)
                                        .foregroundStyle(.orangeEdu)
                                        .scaleEffect(isPressed ? 0.95 : 1.0)
                                    Text("Commencer le test")
                                        .padding()
                                        .foregroundColor(.white)
                                        .font(.custom("SFPro-bold", size: 22))
                                    
                                }
                                .padding(.bottom, 70)
                                .animation(.easeOut(duration: 0.2), value: isPressed)
                                
                            }
                            
                        }
                    }
                    
                }
            }
        }
    }
}
#Preview {
    DiagDescription(hist: MessageHistorique(), mess: Message(auteur: User(email: "", mdp: "", name: "", surname: "", mood: Mood(moodIcon: ""), enCeMoment: EnCeMoment(myMusic: "", myPride: "", myChallenge: "")), destinaire: User(email: "", mdp: "", name: "", surname: "", mood: Mood(moodIcon: ""), enCeMoment: EnCeMoment(myMusic: "", myPride: "", myChallenge: "")), typeQuestion: .poserQuest, message: "")
    )
}


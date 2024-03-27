//
//  QuizRevolution.swift
//  TrueClassLinkProject
//
//  Created by Apprenant 46 on 19/03/2024.
//

import SwiftUI

struct QuizRevolution: View {
    @State var showResults: Bool
    var body: some View {
        ZStack {
            Image("backgroundBase")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Text("La révolution russe")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.orangeEdu)
                    .padding(.top, 60)
                    .padding(.bottom, 50)
                
                Text("Q1: Qui était le chef du gouvernement provisoire formé après l'abdication du tsar Nicolas II ?")
                    .foregroundColor(.purpleEdu)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 50)
                    .padding(.trailing)
             
                HStack {
                    Rectangle()
                        .frame(width: 30, height: 30)
                        .cornerRadius(10)
                        .padding(.trailing,5)
                        .foregroundColor(Color(red: 0.4, green: 0.5, blue: 0.7))
                    Text("Lénine")
                        .font(.subheadline)
                        .foregroundStyle(.purpleEdu)
                        .padding(.trailing, 40)
                    Rectangle()
                            .frame(width: 30, height: 30)
                            .cornerRadius(10)
                            .padding(.trailing,5)
                            .foregroundColor(Color(red: 0.7, green: 0.9, blue: 0.8))
                    Text("J. Staline")
                        .font(.subheadline)
                        .foregroundStyle(.purpleEdu)
                }

               
                HStack {
                    Rectangle()
                            .frame(width: 30, height: 30)
                            .cornerRadius(10)
                            .padding(.trailing,5)
                            .foregroundColor(Color(red: 1, green: 0.9, blue: 0.4))
                            .padding(.leading, 40)
                    Text("A. Kerenski")
                        .font(.subheadline)
                        .foregroundStyle(.purpleEdu)
                    HStack {
                        Rectangle()
                                .frame(width: 30, height: 30)
                                .cornerRadius(10)
                                .padding(.trailing,5)
                                .padding(.leading, 10)
                                .foregroundColor(Color(red: 1, green: 0.8, blue: 0.3))
                        Text("L.Trotski")
                            .font(.subheadline)
                            .foregroundStyle(.purpleEdu)
                            .padding(.trailing, 40)
                    }
                }
                .padding(.bottom, 50)
                    
                
                
                Button(action: {
                    showResults.toggle()
                }, label: {
                    if showResults == false {
                        Image(systemName: "ellipsis.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.greyEdu)
                    } else {
                        VStack {
                            
                            Text("Réponses")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundStyle(.orangeEdu)
                                .padding(.bottom, 5)
                            
                            HStack {
                                VStack {
                                    Text("10%")
                                        .fontWeight(.light)
                                        .foregroundColor(Color(red: 0.3, green: 0.4, blue: 0.8))
                                    Rectangle()
                                        .frame(width: 40, height: 20)
                                        .foregroundColor(Color(red: 0.4, green: 0.5, blue: 0.7))
                                }
                                .offset(x: -15, y: 30)
                                
                                VStack {
                                    Text("25%")
                                        .fontWeight(.light)
                                        .foregroundColor(Color(red: 0.5, green: 0.7, blue: 0.8))
                                    Rectangle()
                                        .frame(width: 40, height: 50)
                                        .foregroundColor(Color(red: 0.7, green: 0.9, blue: 0.8))
                                }
                                .offset(x: -0, y: 15)
                                
                                VStack {
                                    Text("40%")
                                        .fontWeight(.light)
                                        .foregroundColor(Color(red: 0.8, green: 0.7, blue: 0.2))
                                    Rectangle()
                                        .frame(width: 40, height: 80)
                                        .foregroundColor(Color(red: 1, green: 0.9, blue: 0.4))
                                }
                                .offset(x: 10, y: 0)
                                
                                VStack {
                                    Text("20%")
                                        .fontWeight(.light)
                                        .foregroundColor(Color(red: 0.8, green: 0.7, blue: 0.5))
                                    Rectangle()
                                        .frame(width: 40, height: 40)
                                        .foregroundColor(Color(red: 1, green: 0.8, blue: 0.3))
                                }
                                .offset(x: 25, y: 20)
                            }
                            
                            HStack {
                                Rectangle()
                                    .frame(width: 50, height: 40)
                                    .cornerRadius(10)
                                    .padding(.trailing,5)
                                    .foregroundColor(Color(red: 0.4, green: 0.5, blue: 0.7))
                                Rectangle()
                                    .frame(width: 50, height: 40)
                                    .cornerRadius(10)
                                    .padding(.trailing,5)
                                    .foregroundColor(Color(red: 0.7, green: 0.9, blue: 0.8))
                                ZStack {
                                    Rectangle()
                                        .frame(width: 50, height: 40)
                                        .cornerRadius(10)
                                        .padding(.trailing,5)
                                        .foregroundColor(Color(red: 1, green: 0.9, blue: 0.4))
                                    Image(systemName: "checkmark.circle")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.purpleEdu)
                                }
                                Rectangle()
                                    .frame(width: 50, height: 40)
                                    .cornerRadius(10)
                                    .padding(.trailing,5)
                                    .foregroundColor(Color(red: 1, green: 0.8, blue: 0.3))
                            }
                            .offset(x: 8, y: 0)
                            .padding(.bottom, 30)
                         
                            Button(action: {
                                
                            }, label: {
                                Text("Question suivante")
                                    .foregroundColor(.white)
                                    .font(.headline)
                                    .frame(width: 180, height: 50)
                                    .background(.orangeEdu)
                                    .cornerRadius(30)
                            })
                        }
                        
                    }
                })
                
                
               
                
                Spacer()
            }
            
            
        }
    }
}

#Preview {
    QuizRevolution(showResults: false)
}

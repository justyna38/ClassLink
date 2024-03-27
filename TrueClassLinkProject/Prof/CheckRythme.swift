//
//  CheckRythme.swift
//  TrueClassLinkProject
//
//  Created by Apprenant 46 on 19/03/2024.
//

import SwiftUI

struct CheckRythme: View {
    @State var topLenght: CGFloat = 200
    @State var seeResult: Bool
    
    var body: some View {
        ZStack {
            Image("backgroundBase")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Button(action: {
                    seeResult.toggle()
                    
                }, label: {
                    Text("Vérifier le rytme")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(width: 200, height: 50)
                        .background(.orangeEdu)
                        .cornerRadius(30)
                        .padding(.bottom, 50)
                        .padding(.top, topLenght)
                })
                if seeResult == false {
                    
                } else {
                    HStack {
                        VStack {
                            Text("10%")
                                .fontWeight(.light)
                                .foregroundColor(Color(red: 0.3, green: 0.4, blue: 0.8))
                            Rectangle()
                                .frame(width: 40, height: 20)
                                .foregroundColor(Color(red: 0.4, green: 0.5, blue: 0.7))
                        }
                        .offset(x: -30, y: 30)
                        
                        VStack {
                            Text("5%")
                                .fontWeight(.light)
                                .foregroundColor(Color(red: 0.4, green: 0.5, blue: 0.8))
                            Rectangle()
                                .frame(width: 40, height: 10)
                                .foregroundColor(Color(red: 0.5, green: 0.7, blue: 0.8))
                        }
                        .offset(x: -15, y: 35)
                        
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
                }
               
                
                HStack {
                    Image("2")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .padding(.trailing, -25)
                    Image("1")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .padding(.trailing, -25)
                    Image("3")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .padding(.trailing, -25)
                    Image("4")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .padding(.trailing, -25)
                    Image("5")
                        .resizable()
                        .frame(width: 80, height: 80)
                }
                
                
                Spacer()
            }
        }
    }
}

#Preview {
    CheckRythme(seeResult: false)
}

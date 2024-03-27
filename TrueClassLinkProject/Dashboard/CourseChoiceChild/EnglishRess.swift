//
//  EnglishRess.swift
//  TrueClassLinkProject
//
//  Created by Apprenant65 on 15/03/2024.
//

import SwiftUI

struct EnglishRess: View {
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
                        .offset(x: 70, y: -10)
                    
                    imageButton
                        .resizable()
                        .frame(width: 30, height: 30)
                        .offset(x: -45)
                    
                    Text(text)
                        .foregroundColor(.white)
                        .offset(x: 30)
                        .fontWeight(.semibold)
                        .font(.custom("SFPro-bold", size: 25))
                }
                
            }
        }
    }
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("backgroundBase")
                    .resizable()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .scaledToFill()
                
                VStack{
                    Text("Anglais")
                        .fontWeight(.medium)
                        .bold()
                        .font(.custom("SFPro-bold", size: 35))
                        .padding(.bottom, 580)
                }
                
                VStack{
                    NavigationLink(destination: EnglishVid()){
                        OrangeBigButton2(text: "Vidéo", imageButton: Image(systemName: "folder"))
                            .padding(.top, 10)
                            .foregroundStyle(.white)
                    }
                    
                    NavigationLink(destination: EnglishArticles()){
                        OrangeBigButton2(text: "Articles", imageButton: Image(systemName: "folder"))
                            .padding(.top, 10)
                            .foregroundStyle(.white)
                    }
                    
                    //                        NavigationLink(destination: LitView()){
                    //                            OrangeBigButton2(text: "Simple past", imageButton: Image(systemName: "folder"))
                    //                                .padding(.top, 10)
                    //                                .foregroundStyle(.white)
                    //                                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    //                        }
                }
                .padding(.top, 30)
            }
        }
    }
}




#Preview {
    EnglishRess()
}

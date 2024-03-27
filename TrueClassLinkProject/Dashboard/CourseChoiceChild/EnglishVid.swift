//
//  EnglishVid.swift
//  TrueClassLinkProject
//
//  Created by Apprenant65 on 15/03/2024.
//

import SwiftUI

struct EnglishVid: View {
    var body: some View {
        NavigationView {
            ZStack{
                Image("backgroundBase")
                    .resizable()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .scaledToFill()
                
                VStack {
                    Text("Vidéos")
                        .bold()
                        .font(.custom("SFPro-bold", size: 28))
                        .padding(.bottom, 530)
                }
                VStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 15.0)
                            .frame(width: 300, height: 70)
                            .foregroundStyle(.gray)
                            .contrast(7.3)
                        NavigationLink("The UK Education System", destination: WebView(url: URL(string: "https://www.youtube.com/watch?v=glOSCymI6AQ")!))
                        // .padding(.top, 100)
                            .font(.custom("SFPro-bold", size: 22))
                            .foregroundStyle(.orangeEdu)
                    }
                    .padding(.bottom, 20)
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 15.0)
                            .frame(width: 300, height: 70)
                            .foregroundStyle(.gray)
                            .contrast(7.3)
                        NavigationLink("The Canadian \r Education System", destination: WebView(url: URL(string: "https://www.youtube.com/watch?v=yFyWpKYxGCg")!))
                        // .padding(.top, 100)
                            .font(.custom("SFPro-bold", size: 22))
                            .foregroundStyle(.orangeEdu)
                    }
                    .padding(.bottom, 20 )
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 15.0)
                            .frame(width: 300, height: 70)
                            .foregroundStyle(.gray)
                            .contrast(7.3)
                        NavigationLink("Australia's history", destination: WebView(url: URL(string: "https://www.youtube.com/watch?v=-I2JqaxkaWQ")!))
                        // .padding(.top, 100)
                            .font(.custom("SFPro-bold", size: 22))
                            .foregroundStyle(.orangeEdu)
                    }
                    .padding(.bottom, 95)
                }
            }
        }
    }
    
    struct LiView: View {
        let url: URL
        
        var body: some View {
            Text("WebView: \(url)")
        }
    }
}



#Preview {
    EnglishVid()
}

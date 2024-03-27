//
//  EnglishArticles.swift
//  TrueClassLinkProject
//
//  Created by Apprenant65 on 15/03/2024.
//

import SwiftUI

struct EnglishArticles: View {
    var body: some View {
        NavigationView {
            ZStack{
                Image("backgroundBase")
                    .resizable()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .scaledToFill()
                
                VStack {
                    Text("Articles")
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
                        NavigationLink("Internet Safety", destination: WebView(url: URL(string: "https://www.theguardian.com/technology/2024/mar/15/violent-online-content-unavoidable-for-uk-children-ofcom-finds")!))
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
                        NavigationLink("Mental Health", destination: WebView(url: URL(string: "https://www.theguardian.com/society/2024/mar/14/mental-ill-health-causing-sharp-rise-in-benefit-claims-in-uk-data-shows")!))
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
                        NavigationLink("Health", destination: WebView(url: URL(string: "https://www.thesun.co.uk/health/26702977/sleep-experts-top-tips-caffeine/")!))
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
    EnglishArticles()
}

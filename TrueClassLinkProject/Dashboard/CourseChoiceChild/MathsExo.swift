//
//  MathsExo.swift
//  TrueClassLinkProject
//
//  Created by Apprenant65 on 15/03/2024.
//

import SwiftUI

struct MathsExo: View {
    var body: some View {
        NavigationView {
            ZStack{
                Image("backgroundBase")
                    .resizable()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .scaledToFill()
                
                VStack {
                    Text("Exercices")
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
                        NavigationLink("Algorithmes", destination: WebView(url: URL(string: "https://maths-bac.com/maths-Term-complementaires/menu-exercices-algorithmes-ex1.html")!))
                        // .padding(.top, 100)
                            .font(.custom("SFPro-bold", size: 22))
                            .foregroundStyle(.orangeEdu)
                    }
                    .padding(.bottom, 280 )
                }
            }
        }
    }
}


#Preview {
    MathsExo()
}

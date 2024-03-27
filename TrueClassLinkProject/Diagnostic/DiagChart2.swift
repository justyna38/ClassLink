//
//  DiagChart2.swift
//  TrueClassLinkProject
//
//  Created by Apprenant63 on 19/03/2024.
//

import SwiftUI

struct DiagChart2: View {
    let data: [Double]
    let categories: [String]
    let maxValue: Double
    let colors: [Color]
    
    @State private var selectedCategoryIndex: Int? = nil
    
    var body: some View {
        VStack {
            ZStack {
                ForEach(0..<data.count, id: \.self) { index in
                    
                    let angle = -Double(index) * 2 * .pi / Double(self.data.count)
                    let value = self.data[index]
                    let normalizedValue = value / self.maxValue
                    let radius: CGFloat = 200 // Augmenter le rayon pour agrandir le graphique
                    //                        Dessin des éléments du graphisme
                    Path { path in
                        path.move(to: CGPoint(x: 300, y: 300))
                        let x = radius * CGFloat(normalizedValue) * CGFloat(cos(angle))
                        let y = radius * CGFloat(normalizedValue) * CGFloat(sin(angle))
                        path.addLine(to: CGPoint(x: 300 + x, y: 300 + y))
                    }
                    .stroke(self.colors[index], lineWidth: 5)
                    .onTapGesture {
                        self.selectedCategoryIndex = index
                        
                    }
                }
                
                if let selectedIndex = self.selectedCategoryIndex {
                    
                    // Afficher la légende dans un popup
                    
                    GeometryReader { geo in
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(self.colors[selectedIndex])
                                .frame(width: 200, height: 100)
                                .overlay(
                                    HStack {
                                        Text("\(self.categories[selectedIndex])")
                                            .foregroundColor(.white)
                                            .font(.custom("SFPro-bold", size: 18))
                                        Text("\(Int((self.data[selectedIndex] / self.maxValue) * 100))%")
                                            .foregroundColor(.white)
                                            .font(.custom("SFPro-bold", size: 18))
                                    }
                                )
                                .position(x: geo.size.width / 2, y: geo.size.height / 2)
                        }
                    }
                    .frame(width: 300, height: 300)
                    .onTapGesture {
                        self.selectedCategoryIndex = nil // Fermer le popup en cliquant dessus
                    }
                }
            }
            .offset(x: -30, y: 0)
            .padding(.top, 30)
            
            ForEach(0..<categories.count, id: \.self) { index in
                VStack {
                    HStack {
                        Circle()
                            .fill(self.colors[index])
                            .frame(width: 10, height: 10)
                        
                        Text(self.categories[index])
                            .font(.custom("SFPro-bold", size: 16))
                    }
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                }
            }
        }
        .padding(.bottom, 80)
        
        
    }
}

struct DiagChart2View: View {
    
    let data: [Double] = [20, 25, 30, 70, 35, 50, 82, 63, 44]
    let categories: [String] = ["Harcèlement", "Problèmes de santé", "Handicap", "Manque de soutien", "Problèmes familiaux/sociaux", "Stress", "Démotivation", "Isolement", "Parcours inadapté"]
    let maxValue: Double = 100
    let colors: [Color] = [.red, .blue, .green, .yellow, .orange, .purple, .pink, .cyan, .teal]
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("backgroundBase")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                Text("Facteurs de risque")
                    .font(.custom("SF Pro-Bold", size: 24))
                    .foregroundColor(Color.orangeEdu)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, -310)
                
                DiagChart2(data: data, categories: categories, maxValue: maxValue, colors: colors)
                //                        .padding(.trailing, 0)
                
            }
        }
    }
}


#Preview {
    DiagChart2View()
}

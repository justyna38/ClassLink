//
//  DiagChart.swift
//  TrueClassLinkProject
//
//  Created by Apprenant63 on 17/03/2024.
//

import SwiftUI

struct DiagChartView: View {
    
    @State private var selectedCategoryIndex: Int? = nil
    
    let data: [(String, Double)]
    @State private var isPopupOpen = false
    @State private var popupScale: CGFloat = 0.001 // Démarre de 0.001 pour un effet d'ouverture
    
    var maxValue: Double {
        data.map { $0.1 }.max() ?? 0
    }
    
    
    var body: some View {
        
        VStack {
            HStack(alignment: .bottom, spacing: 20) {
                ForEach(data, id: \.0) { category in
                    VStack {
                        Text("\(Int(category.1))")
                            .font(.custom("SFPro-bold", size: 16))
                        Rectangle()
                            .fill(self.barColor(category: category.0))
                            .frame(width: 20, height: CGFloat(category.1 / maxValue * 200))
                            .onTapGesture {
                                if category.0 == "Difficultés" {
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        self.isPopupOpen.toggle()
                                    }
                                }
                            }
                        Text(category.0)
                            .font(.custom("SFPro-bold", size: 16))
                    }
                    .offset(x: 0, y: -140)
                }
            }
        }
        .overlay(
            Group {
                if isPopupOpen {
                    PopupView(text: "Ce taux est le cumul de l'ensemble des classes de l'école: 80% des élèves éprouvent des difficultés. Les difficultés sont segmentés en plusieurs types, dont les détails sont disponible dans le rapport global. Il peut-être intéressant de comparé les résultats d'une classe par rapport à l'ensemble des effectifs au sein de l'école")
                        .scaleEffect(self.popupScale)
                        .transition(.scale)
                }
            }
        )
        .onAppear {
            withAnimation(Animation.easeInOut(duration: 0.3).delay(0.2)) {
                self.popupScale = 1 // Augmente la taille du popup à 100% de sa taille normale
            }
        }
    }
    
    func barColor(category: String) -> Color {
        switch category {
        case "Difficultés": return .red
        case "Motivations": return .yellow
        case "Attentes": return .blue
        case "Orientation": return .green
        default: return .green
        }
    }
}

struct PopupView: View {
    let text: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.orangeEdu)
            .frame(width: 300, height: 250)
            .overlay(
                Text(text)
                    .foregroundColor(.white)
                    .font(.custom("SF Pro-Regular", size: 16))
                    .frame(maxWidth: 250)
            )
            .onTapGesture {
                // Fermeture du popup lorsqu'on appuie dessus
                // ce serait bien d'avoir un reverse de l'animation d'ouverture
            }
    }
}

struct DiagChart: View {
    var body: some View {
        
        NavigationView {
            ZStack {
                Image("backgroundBase")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    Text("TENDANCES")
                        .font(.custom("SF Pro-Bold", size: 24))
                        .foregroundColor(Color.orangeEdu)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 110)
                    
                    ScrollView {
                        
                        VStack {
                            Text("Statistiques des classes")
                                .font(.custom("SF Pro-Bold", size: 22))
                                .foregroundColor(Color.orangeEdu)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(.top, 30)
                            
                            DiagChartView(data: [("Difficultés", 80), ("Attentes", 65), ("Motivations", 40), ("Orientation", 25)])
                                .padding(.top, 140)
                            
                            Text("Facteurs de risque")
                                .font(.custom("SF Pro-Bold", size: 22))
                                .foregroundColor(Color.orangeEdu)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(.top, -100)
                            
                            DiagChart2View()
                                .padding(.top, -60)
                        }
                        //                            .offset(x: 0, y: 230)
                    }
                }
            }
        }
    }
}
#Preview {
    DiagChart()
}

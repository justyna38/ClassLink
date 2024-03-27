//
//  PageProfilComplete.swift
//  TrueClassLinkProject
//
//  Created by Apprenant 46 on 19/03/2024.
//

import SwiftUI

struct PageProfilComplete: View {
    @State private var currentIndex = 0
    private let colors: [Color] = [.white, .white]
    
    var body: some View {
        
            ZStack {
                Image("backgroundBase")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    TabView(selection: $currentIndex) {
                        AnnaelStudentProfileView(profileEditMode: false, profilePictureExists: true, eleve: studentProfiles[0], showingAlert: false)
                        PageProfilDiagnostic(profileEditMode: false, profilePictureExists: true, eleve: studentProfiles[0])
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    dotsIndexView(numberOfPages: colors.count, currentIndex: currentIndex)
                }
                
            }
            
        }
        
    
    
    struct dotsIndexView: View {
        
        let numberOfPages: Int
        let currentIndex: Int
        private let circleSize: CGFloat = 16
        private let circleSpacing: CGFloat = 12
        private let primaryColor = Color.white
        private let secondaryColor = Color.white.opacity(0.6)
        private let smallScale: CGFloat = 0.6
        
        var body: some View {
            ZStack {
                Rectangle()
                    .foregroundStyle(.orangeEdu)
                    .frame(width: 80, height: 30)
                    .cornerRadius(16)
                HStack(spacing: circleSpacing) {
                    ForEach(0..<numberOfPages) { index in
                        if shouldShowIndex(index) {
                            Circle()
                                .fill(currentIndex == index ? primaryColor : secondaryColor)
                                .scaleEffect(currentIndex == index ? 1 : smallScale)
                                .frame(width: circleSize, height: circleSize)
                                .transition(AnyTransition.opacity.combined(with: .scale))
                                .id(index)
                        }
                    }
                }
            }
        }
        
        func shouldShowIndex(_ index: Int) -> Bool {
            ((currentIndex - 1)...(currentIndex + 1)).contains(index)
        }
    }
}


#Preview {
    PageProfilComplete()
}

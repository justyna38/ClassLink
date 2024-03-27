//
//  ProfileTextView.swift
//  TrueClassLinkProject
//
//  Created by Apprenant 46 on 15/03/2024.
//

import SwiftUI


struct ProfileText: View {
    // pas de possibilité d'éditer le champs nom & classe : c'est fait automatiquement par l'établissement

        var body: some View {
                VStack(alignment: .leading) {
                    Text("Annaël Arzel") //Data : userName
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.orangeEdu)
                    Text("2de5") // Data : userClass
                        .font(.subheadline)
                        .fontWeight(.light)
                        .foregroundStyle(.greyEdu)
                }
               
            
        }
    }


#Preview {
    ProfileText()
}

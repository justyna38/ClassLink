//
//  ProfileEditButtonView.swift
//  TrueClassLinkProject
//
//  Created by Apprenant 46 on 15/03/2024.
//

import SwiftUI

struct ProfileEditButton: View {
    @Binding var profileEditMode: Bool
    
    var body: some View {
        VStack {
            Button(action: {
                if profileEditMode {
                    //sauvegarder les changements sur la page de profil profilepicture = profile picture par exemple ?
                    profileEditMode = false
                } else {
                    profileEditMode = true
                }
            }, label: {
                if profileEditMode {
                    ZStack {
                        Circle()
                            .frame(width: 30)
                            .foregroundStyle(.orangeEdu)
                        Image(systemName: "checkmark.circle")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundStyle(.white)
                    }
                } else {
                    ZStack {
                        Circle()
                            .frame(width: 30)
                            .foregroundStyle(.orangeEdu)
                        Image(systemName: "pencil.circle")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundStyle(.white)
                    }
                }
            })
            
            Button(action: {
                profileEditMode = false
            }, label: {
                if profileEditMode {
                    ZStack {
                        Circle()
                            .frame(width: 30)
                            .foregroundStyle(.greyEdu)
                        Image(systemName: "xmark.circle")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundStyle(.white)
                    }
                } else {
                }})
        }
    }
}


#Preview {
    ProfileEditButton(profileEditMode: .constant(true))
}

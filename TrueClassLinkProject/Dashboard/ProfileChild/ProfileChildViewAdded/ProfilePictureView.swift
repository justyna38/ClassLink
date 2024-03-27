//
//  ProfilePictureView.swift
//  TrueClassLinkProject
//
//  Created by Apprenant 46 on 15/03/2024.
//

import SwiftUI

struct ProfilePicture: View {
        @Binding var profileEditMode: Bool
        @Binding var profilePictureExists: Bool
        
        var body: some View {
            if profileEditMode == false && profilePictureExists {
                Image("studentPP") //Data : Profile picture
                    .resizable()
                    .frame(width: 80, height: 80)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(Color(.orangeEdu), lineWidth: 5))
            } else if profileEditMode == false && profilePictureExists == false {
                ZStack {
                    Circle()
                        .frame(width: 80, height: 80)
                        .foregroundStyle(.orangeEdu)
                    Text("Pas de photo de profil")
                        .font(.caption)
                        .fontWeight(.light)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .frame(width: 70)
                }
                    
            } else if profileEditMode && profilePictureExists {
                ZStack {
                    Image("studentPP") //Data : Profile picture
                        .resizable()
                        .frame(width: 80, height: 80)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color(.greyEdu), lineWidth: 5))
                    
                    Button(action: { //petite croix suppression photo
                        if profilePictureExists && profileEditMode == false {
                            
                        } else if profilePictureExists && profileEditMode {
                            //empty pp data
                            profilePictureExists = false
                        } else if profilePictureExists == false {
                            
                        }
                        
                    }, label: {
                        if profilePictureExists && profileEditMode == false {
                            // pas de croix
                        } else if profilePictureExists && profileEditMode {
                            ZStack {
                                Circle()
                                    .frame(width: 35)
                                    .foregroundStyle(.greyEdu)
                                Image(systemName: "xmark.circle")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .foregroundStyle(.white)
                            }
                        } else if profilePictureExists == false {
                            // pas de croix
                        }
                    })
                    .offset(x: 30, y: -30)
                }
            } else if profileEditMode && profilePictureExists == false {
                ZStack {
                    Circle()
                         .frame(width: 80, height: 80)
                         .foregroundStyle(.greyEdu)
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .foregroundStyle(.white)
                }
            }
        }
    }


#Preview {
    ProfilePicture(profileEditMode: .constant(true), profilePictureExists: .constant(true))
}

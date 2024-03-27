//
//  DMButtonView.swift
//  TrueClassLinkProject
//
//  Created by Apprenant 46 on 15/03/2024.
//

import SwiftUI

struct DMButton: View {
    var body: some View {
            ZStack {
                Circle()
                    .frame(width: 30)
                    .foregroundStyle(.orangeEdu)
                Image(systemName: "envelope.fill")
                    .resizable()
                    .frame(width: 20, height: 15)
                    .foregroundStyle(.white)
            }
    }
} // créer le bouton de navigation vers messages privés


#Preview {
    DMButton()
}

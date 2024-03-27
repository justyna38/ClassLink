//
//  TrueClassLinkProjectApp.swift
//  TrueClassLinkProject
//
//  Created by Apprenant98 on 12/03/2024.
//

import SwiftUI

@main
struct TrueClassLinkProjectApp: App {
    let eleveList = EleveList()
    var body: some Scene {
        WindowGroup {
            InscriptionConnexion(hist: MessageHistorique(), eleveList: EleveList())
                .environmentObject(eleveList)
                .environmentObject(UserChoice())
        }
    }
}

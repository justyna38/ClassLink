//
//  Question.swift
//  Classes
//
//  Created by Justyna Warzecha on 11/03/2024.
//

import Foundation

class Question {
    let question: String
    let choix: [String]
    
    init(text: String, choices: [String]) {
        self.question = text
        self.choix = choices
    }
}

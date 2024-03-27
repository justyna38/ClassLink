//
//  TestDiagnostique.swift
//  Classes
//
//  Created by Justyna Warzecha on 11/03/2024.
//

import Foundation

class Test {
    var questions: [Question] = []
    var testName: String
    
    init(testName: String) {
        self.testName = testName
    }
    
    func addQuestion(question: Question) {
        questions.append(question)
    }
    
}

class testMotivation: Test {
    
}

class TestDifficulte: Test {
    
}

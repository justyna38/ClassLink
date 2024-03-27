//
//  Classes.swift
//  Classes
//
//  Created by Justyna Warzecha on 11/03/2024.
//

import Foundation

class Classes: ObservableObject {
    
    @Published var name: String
    
    init(name: String) {
        self.name = name
    }
}

class ListeClasses: ObservableObject {
    
    @Published var classes: [Classes] = []
    
    init() {
        let classe1 = Classes(name: "2nd1")
        classes.append(classe1)
        //        self.listeClasses = listeClasses
        //        self.listeClasses.addClass(className: "2nd1")
        //        self.listeClasses.addClass(className: "2nd2")
        //        self.listeClasses.addClass(className: "2nd3")
        //        self.listeClasses.addClass(className: "1er1")
        //        self.listeClasses.addClass(className: "1er2")
        //        self.listeClasses.addClass(className: "1er3")
        //        self.listeClasses.addClass(className: "Ter1")
        //        self.listeClasses.addClass(className: "Ter2")
        //        self.listeClasses.addClass(className: "Ter3")
    }
    
    func addClass(className: String) {
        let newClass = Classes(name: className)
        classes.append(newClass)
    }
}

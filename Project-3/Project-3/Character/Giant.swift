//
//  Giant.swift
//  Project-3
//
//  Created by Christophe Bugnon on 10/11/2017.
//  Copyright © 2017 Christophe Bugnon. All rights reserved.
//

import Foundation

// Class Giant inherit of Character class
class Giant: Character {
    // Properties of class Giant
    // let type for indicate type at user
    let type = "Giant"
    
    // Constructor
    init() {
        // Name: (String), Life: 120
        // Use "Giant" name before create readline() for user choose name
        super.init(name: "Giant", life: 120)
    }
    
    // Rewriting of the function getType of the class mother
    // func for indicate at player what type of character he will choose
    override func getType() -> String {
        // let classe for add before let type
        let classe = "Class: "
        return classe + type
    }
}

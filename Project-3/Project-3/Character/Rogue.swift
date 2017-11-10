//
//  Rogue.swift
//  Project-3
//
//  Created by Christophe Bugnon on 10/11/2017.
//  Copyright © 2017 Christophe Bugnon. All rights reserved.
//

import Foundation

// Subclass of Character for create Rogue character

// Class Rogue inherit of Character class
class Rogue: Character {
    // Properties of class Rogue
    // let type for indicate type character at user
    let type = "Rogue"
    
    // Constructor
    init() {
        // Name: (String), Life: 80
        // Use "Rogue" name before create readline() for user choose name
        super.init(name: "Rogue", life: 80)
    }
    
    // Rewriting of the function getType of the class mother
    // overrider func for indicate at player what type of character he will choose
    override func getType() -> String {
        // let classe for add before let type
        let classe = "Class: "
        return classe + type
    }
}

//
//  Mage.swift
//  Project-3
//
//  Created by Christophe Bugnon on 10/11/2017.
//  Copyright © 2017 Christophe Bugnon. All rights reserved.
//

import Foundation

// Subclass of Character for create Mage character

// Class Mage inherit of Character class
class Mage: Character {
    // Properties of class Mage
    // let type for indicate type character at user
    let type = "Mage"
    
    // Constructor
    init() {
        // Name: (String), Life: 100
        // Use "Mage" name before create readline() for user choose name
        super.init(name: "Mage", life: 100)
    }
    
    // Rewriting of the function getType of the class mother
    // override func for indicate at player what type of character he will choose
    override func getType() -> String {
        // let classe for add before let type
        let classe = "Class: "
        return classe + type
    }
}

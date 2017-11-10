//
//  Warrior.swift
//  Project-3
//
//  Created by Christophe Bugnon on 10/11/2017.
//  Copyright © 2017 Christophe Bugnon. All rights reserved.
//

import Foundation

// Subclass of Character for create Warrior character

// Class Warrior inherit of Character class
class Warrior: Character {
    // Properties of class Warrior
    // let type for indicate type at user
    let type = "Warrior"
    
    // Constructor
    init() {
        // Name: (String), Life: 100
        // Use "Warrior" name before create readline() for user choose name
        super.init(name: "Warrior", life: 100)
    }
    
    // Rewriting of the function getType of the class mother
    // func for indicate at player what type of character he will choose
    override func getType() -> String {
        // let classe for add before let type
        let classe = "Class: "
        return classe + type
    }
}

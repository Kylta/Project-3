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
        // Name: (String), Life: 80, weapon: Dagger (Damage: 15), level: 1 (Bonus)
        // Use Tools.nameCharacter() for user choose name
        super.init(name: Tools.nameCharacter(), life: 80, weapon: Dagger(), level: 1)
    }
    
    // Rewriting of the function getType of the class mother
    // overrider func for indicate at player what type of character he will choose
    override func getType() -> String {
        // let classe for add before let type
        let classe = "Class: "
        return classe + type
    }
    
    // Method for ultimatum Rogue (BONUS)
    func punishment(_ character: Character) {
        // If opponent charater is a Giant then damage = 35
        if character is Giant {
            character.life -= 35
            print("\(character.name) takes 35 damage, now \(character.name) had \(character.life) point of life !")
        } else {
            // If opponent charater is other than Giant then damage = 25
            character.life -= 25
            print("\(character.name) takes 25 damage, now \(character.name) had \(character.life) point of life !")
        }
    }
}

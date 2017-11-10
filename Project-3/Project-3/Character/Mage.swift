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
        // Name: (String), Life: 100, weapon: Baton (Heal: 7)
        // Use Tools.nameCharacter() for user choose name
        super.init(name: Tools.nameCharacter(), life: 100, weapon: Baton())
    }
    
    // Rewriting of the function getType of the class mother
    // override func for indicate at player what type of character he will choose
    override func getType() -> String {
        // let classe for add before let type
        let classe = "Class: "
        return classe + type
    }
    
    // Method for Mage heal
    func heal(_ character: Character) {
        // contante for baton as Baton
        let baton = self.weapon as! Baton
        
        // When mage use heal, baton.heal (heal: 7) whill had 7 points of life at character choosen
        character.life += baton.heal
        
        // If character is Mage, he can't had more than 100 points of life (init in the class)
        if let characterLife = character as? Mage {
            if characterLife.life > 100 {
                characterLife.life = 100
            }
        }
        // If character is Warrior, he can't had more than 100 points of life (init in the class)
        if let characterLife = character as? Warrior {
            if characterLife.life > 100 {
                characterLife.life = 100
            }
        }
        // If character is Giant, he can't had more than 120 points of life (init in the class)
        if let characterLife = character as? Giant {
            if characterLife.life > 120 {
                characterLife.life = 120
            }
        }
        // If character is Rogue, he can't had more than 80 points of life (init in the class)
        if let characterLife = character as? Rogue {
            if characterLife.life > 80 {
                characterLife.life = 80
            }
        }
        // Indicate at user than Mage has heal character
        print("\(name) heal \(character.name) of \(baton.heal) points of life with \(weapon.name) and now \(character.name) life is \(character.life).\n")
    }
}

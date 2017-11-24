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
        // Name: (String), Life: 100, weapon: Baton (Heal: 7), level: 1 (Bonus)
        // Use Tools.nameCharacter() for user choose name
        super.init(name: Tools.nameCharacter(), life: 100, weapon: Weapon(name: "Baton", damage: 0, heal: Int(arc4random_uniform(7) + 3), type: .Baton), level: 1, maxLife: 100)
        self.weapon.type = .Baton
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
        
        // When mage use heal, baton.heal (heal: 7) whill had 7 points of life at character choosen
        character.life += weapon.heal!
        
        if character.life > character.maxLife {
            character.life = character.maxLife
        }
        // Indicate at user than Mage has heal character
        print("\(name) heal \(character.name) of \(weapon.heal!) points of life with \(weapon.name) and now \(character.name) life is \(character.life).\n")
    }
    
    // Method for ultimatum Mage (BONUS)
    func blessing(_ character: Player) {
        // Give + 10 points of life at all characters of his team
        let randomHeal = Int(arc4random_uniform(30) + 15)
        for characters in character.team {
            characters.life += randomHeal
            
            if characters.life > characters.maxLife {
                characters.life = characters.maxLife
            }
            print("\(name) heal \(characters.name) of \(randomHeal) points of life and now \(characters.name) is \(characters.life) point of life!")
        }
    }
}

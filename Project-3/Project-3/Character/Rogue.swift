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
        super.init(name: Tools.nameCharacter(), life: 80, weapon: Weapon(name: "Dagger", damage: 15, type: .Dagger), level: 1, maxLife: 80)
        self.weapon.type = .Dagger
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
        // If opponent charater is a Giant then damage are from 20 to 80.
        if character is Giant {
            // Made random damages at Giant opponent characters class (1 target)
            let randomPunishment = Int(arc4random_uniform(60) + 20)
            
            if character.armor >= 1 {
                reduceArmore(character: character, damage: randomPunishment, string: "with Punishment")
            } else {
                character.life -= randomPunishment
                deathCharacter(character: character)
                print("\(character.name) takes \(randomPunishment) damage and now \(character.name) had \(character.life) point of life !")
            }
        } else {
            // Made random damages at all other characters class (1 target). Damage from 10 to 50 damage.
            let randomPunishment = Int(arc4random_uniform(40) + 10)
            
            if character.armor >= 1 {
                reduceArmore(character: character, damage: randomPunishment, string: ("with Punishment"))
            } else {
                character.life -= randomPunishment
                deathCharacter(character: character)
                print("\(character.name) takes \(randomPunishment) damage, and now \(character.name) had \(character.life) point of life !")
            }
        }
    }
}

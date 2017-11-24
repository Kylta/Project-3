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
        // If opponent charater is a Giant then damage = 35
        if character is Giant {
            let randomPunishment = Int(arc4random_uniform(60) + 20)
            let characterArmor = character.armor
            
            if character.armor > 1 {
                character.armor -= randomPunishment
                
                if character.armor < 0 {
                    character.armor = 0
                    character.life -= (randomPunishment - characterArmor)
                    print("\(character.name) take \(randomPunishment) damage, his armor absorb \(characterArmor) damage and take \(randomPunishment - characterArmor) damage !")
                } else {
                    print("\(self.name) made \(randomPunishment) damage at \(character.name) with PUNISHMENT and now \(character.name) armor is \(character.armor).\n")
                }
            } else {
                character.life -= randomPunishment
                print("\(character.name) takes \(randomPunishment) damage and now \(character.name) had \(character.life) point of life !")
            }
        } else {
            let randomPunishment = Int(arc4random_uniform(40) + 10)
            let characterArmor = character.armor
            
            if character.armor > 1 {
                character.armor -= randomPunishment
                
                if character.armor < 0 {
                    character.armor = 0
                    character.life -= (randomPunishment - characterArmor)
                    print("\(character.name) take \(randomPunishment) damage, his armor absorb \(characterArmor) damage and take \(randomPunishment - characterArmor) damage !")
                } else {
                    print("\(self.name) made \(randomPunishment) damage at \(character.name) with PUNISHMENT and now \(character.name) armor is \(character.armor).\n")
                }
            } else {
                character.life -= randomPunishment
                print("\(character.name) takes \(randomPunishment) damage, and now \(character.name) had \(character.life) point of life !")
            }
        }
    }
}

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
    // let type for indicate type character at user
    let type = "Warrior"
    
    // Constructor
    init() {
        // Name: (String), Life: 100, Weapon: Sword (Damage: 10), level: 1 (Bonus)
        // Use Tools.nameCharacter() for user choose name
        super.init(name: Tools.nameCharacter(), life: 100, weapon: Weapon(name: "Sword", damage: 10, type: .Sword), level: 1, maxLife: 100)
        self.weapon.type = .Sword
    }
    
    // Rewriting of the function getType of the class mother
    // override func for indicate at player what type of character he will choose
    override func getType() -> String {
        // let classe for add before let type
        let classe = "Class: "
        return classe + type
    }
    
    // Bonus for Warrior, Ultimatum. From 25 to 55 random damage at opponent characters.
    func spinningBlade(_ player: Player) {
        // Made random damages at all opponent characters
        let randomSpinningBlade = Int(arc4random_uniform(30) + 25)
        
        for character in player.team {
            if character.armor >= 1 {
                reduceArmore(character: character, damage: randomSpinningBlade, string: "with SpinningBlade")
            } else {
                character.life -= randomSpinningBlade
                deathCharacter(character: character)
                //  deathCharacter(character: characters)
                print("\(character.name) takes \(randomSpinningBlade) damage and now \(character.name) life is \(character.life)!")
            }
        }
    }
}


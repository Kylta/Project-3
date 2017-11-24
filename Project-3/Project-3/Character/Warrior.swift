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
    
    // Method for ultimatum Warrior (BONUS)
    func spinningBlade(_ character: Player) {
        // Made 15 damages at all opponent characters
        let randomSpinningBlade = Int(arc4random_uniform(30) + 25)
        
        for characters in character.team {
            let characterArmor = characters.armor
            if characters.armor > 1 {
                characters.armor -= randomSpinningBlade
                
                if characters.armor < 0 {
                    characters.armor = 0
                    characters.life -= (randomSpinningBlade - characterArmor)
                    print("\(characters.name) take \(randomSpinningBlade) damage, lost \(characterArmor) armor and now \(characters.name) is \(characters.life) life!")
                } else {
                    print("\(self.name) made \(weapon.damage) damage at \(character.name) with \(weapon.name) and now \(character.name) armor is \(characters.armor).\n")
                }
            } else {
                print("\(characters.name) takes \(randomSpinningBlade) damage and now \(characters.name) life is \(characters.life - randomSpinningBlade)!")
            }
        }
    }
}


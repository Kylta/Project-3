//
//  Giant.swift
//  Project-3
//
//  Created by Christophe Bugnon on 10/11/2017.
//  Copyright © 2017 Christophe Bugnon. All rights reserved.
//

import Foundation

// Subclass of Character for create Giant character

// Class Giant inherit of Character class
class Giant: Character {
    // Properties of class Giant
    // let type for indicate type character at user
    let type = "Giant"
    
    // Constructor
    init() {
        // Name: (String), Life: 120, weapon: Mass (Damage: 5), level: 1 (Bonus)
        // Use Tools.nameCharacter() for user choose name
        super.init(name: Tools.nameCharacter(), life: 120, weapon: Weapon(name: "Mass", damage: 5, type: .Mass), level: 1, maxLife: 120)
        self.weapon.type = .Mass
    }
    
    // Rewriting of the function getType of the class mother
    // override func for indicate at player what type of character he will choose
    override func getType() -> String {
        // let classe for add before let type
        let classe = "Class: "
        return classe + type
    }
    
    // Method for ultimatum Giant (BONUS)
    func earthquake(_ character: Player) {
        // Made 10 damages at all opponent characters
        let randomEarthquake = Int(arc4random_uniform(30) + 15)
        
        for characters in character.team {
            let characterArmor = characters.armor
            if characters.armor > 1 {
                characters.armor -= randomEarthquake
                
                if characters.armor < 0 {
                    characters.armor = 0
                    characters.life -= (randomEarthquake - characterArmor)
                    print("\(characters.name) take \(randomEarthquake) damage, lost \(characterArmor) armor and now \(characters.name) is \(characters.life) life!")
                } else {
                    print("\(self.name) made \(weapon.damage) damage at \(character.name) with \(weapon.name) and now \(character.name) armor is \(characters.armor).\n")
                }
            } else {
                print("\(characters.name) takes \(randomEarthquake) damage and now \(characters.name) life is \(characters.life - randomEarthquake)!")
            }
        }
    }
}

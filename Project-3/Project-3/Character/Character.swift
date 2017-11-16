//
//  Character.swift
//  Project-3
//
//  Created by Christophe Bugnon on 10/11/2017.
//  Copyright © 2017 Christophe Bugnon. All rights reserved.
//

import Foundation

// Master class for characters

class Character {
    // Properties of class Character
    
    // Name for character (String)
    var name: String
    // Life for character (Int)
    var life: Int
    // add class Weapon at class Character for character take weapon
    var weapon: Weapon
    // Level of character (BONUS)
    var level: Int
    
    // Constructor
    
    convenience init() {
        // Create Character with properties empty
        self.init(name: "", life: 0, weapon: Baton(), level: 0)
    }
    init(name: String, life: Int, weapon: Weapon, level: Int) {
    self.name = name
    self.life = life
    self.weapon = weapon
    self.level = level
    }
    
    // Get infos from class
    func getInfos() -> String {
        return "Name: \(self.name) \nLife: \(self.life)"
    }
    
    // Instruction allowing to consider this function in the subclasses
    func getType() -> String {
        assert(false, "Write it in subclass Character")
    }
    
    // Method for characters attack
    func attack(_ character: Character) {
        // Use on character the method receiveDamage for put the damage of the weapon init at characters
        character.life -= weapon.damage
        
         // If character life is under 0, life = 0. Then life can't be under 0.
        if character.life <= 0 {
            character.life = 0
        }
        
        // Indicate at user character has been attacked
        print("\(self.name) made \(weapon.damage) damage at \(character.name) with \(weapon.name) and now \(character.name) life is \(character.life).\n")
    }
    
    // Method for character receive damage
    func receiveDamage(damage: Int) {
        // Remove life of damage put in setting
        life -= damage
        
        // If the life is under 0, life = 0. Then life can't be under 0.
        if life < 0 {
            life = 0
        }
    }
    
    // Method for character up level
    func upLevel(turn: Int) {
        if turn == 3 {
            self.level += 1
            print("\(self.name) up level \(self.level) !")
        }
    }
}



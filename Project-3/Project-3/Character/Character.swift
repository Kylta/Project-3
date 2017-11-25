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
    // Armor of character (BONUS)
    var armor : Int
    // Max life of character
    var maxLife: Int
    // Count turn level for character (BONUS)
    var turnLevel: Int
    
    // Constructor
    convenience init() {
        // Create Character with properties empty
        self.init(name: "", life: 0, weapon: Weapon(name: "", damage: 0, type: .Hands), level: 0, maxLife: 0)
    }
    
    init(name: String, life: Int, weapon: Weapon, level: Int, maxLife: Int) {
        self.name = name
        self.life = life
        self.weapon = weapon
        self.level = level
        self.armor = 0
        self.maxLife = maxLife
        self.turnLevel = 0
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
        
        if character.armor > 1 {
            reduceArmore(character: character, damage: weapon.damage, string : "with \(weapon.name)")
        } else {
            character.life -= weapon.damage
            /*  // If the life is under 0, life = 0. Then life can't be under 0.
             if character.life < 0 {
             character.life = 0
             }*/
            deathCharacter(character: character)
            print("\(self.name) made \(weapon.damage) damage at \(character.name) with \(weapon.name) and now \(character.name) life is \(character.life).\n")
        }
    }
    
    // Indicate at user character has been attacked
    func reduceArmore(character: Character, damage: Int, string: String) {
        let weaponDamage = damage
        let characterArmor = character.armor
        
        if character.armor >= 1 {
            character.armor -= weaponDamage
            
            if character.armor <= 0 {
                character.armor = 0
                character.life -= (weaponDamage - characterArmor)
                /*    if character.life < 0 {
                 character.life = 0
                 }*/
                deathCharacter(character: character)
                print("\(character.name) take \(damage) damage, his armor absorb \(characterArmor) damage and \(character.name) take \(damage - characterArmor) damage ! Now \(character.name) had \(character.life) points of life !")
            } else {
                print("\(self.name) made \(damage) damage at \(character.name) \(string) and now \(character.name) armor is \(character.armor).\n")
            }
        }
    }
    
    func deathCharacter(character: Character) {
        if character.life < 0 {
            character.life = 0
        }
    }
    
    // Method for character up level
    func upLevel(turn: Int) {
        if turn == 3 || turn == 6 || turn == 9 {
            self.level += 1
            print("\(self.name) up level \(self.level) !")
        }
    }
    
    func changeWeapon(character: Character) -> Weapon {
        // Initalise variable previsouWeapon
        let weapon = Weapon()
        
        // Create Array of weapons
        let newWeapons = [
            Weapon(name: "Super Sword", damage: Int(arc4random_uniform(26) + 15), type: .Sword),
            Weapon(name: "Cartoon Sword", damage: Int(arc4random_uniform(6) + 1), type: .Sword),
            Weapon(name: "Sword", damage: 10, type: .Sword),
            Weapon(name: "Super Mass", damage: Int(arc4random_uniform(21) + 10), type: .Mass),
            Weapon(name: "Cartoon Mass", damage: 1, type: .Mass),
            Weapon(name: "Mass", damage: 5, type: .Mass),
            Weapon(name: "Super Dagger", damage: Int(arc4random_uniform(31) + 20), type: .Dagger),
            Weapon(name: "Cartoon Dagger", damage: Int(arc4random_uniform(5) + 5), type: .Dagger),
            Weapon(name: "Dagger", damage: 15, type: .Dagger),
            Weapon(name: "Super Baton", damage: 0, heal: Int(arc4random_uniform(26) + 15), type: .Baton),
            Weapon(name: "Carton Baton", damage: 0, heal: Int(arc4random_uniform(6) + 1), type: .Baton),
            Weapon(name: "Baton", damage: 0, heal: Int(arc4random_uniform(15) + 6), type: .Baton),
            ]
        
        // Init randomVal with random element in newWeapons array
        var randomVal = newWeapons[Int(arc4random_uniform(UInt32(newWeapons.count)))]
        
        while weapon.type != character.weapon.type || character.weapon.name == randomVal.name {
            randomVal = newWeapons[Int(arc4random_uniform(UInt32(newWeapons.count)))]
            if character.weapon.type == randomVal.type && character.weapon.name != randomVal.name {
                character.weapon = randomVal
                
                return randomVal
            }
        }
        return randomVal
    }
}


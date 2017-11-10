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
    
    // Constructor
    init(name: String, life: Int, weapon: Weapon) {
    self.name = name
    self.life = life
    self.weapon = weapon
    }
    
    // Get infos from class
    func getInfos() -> String {
        return "Name: \(self.name) \nLife: \(self.life)"
    }
    
    // Instruction allowing to consider this function in the subclasses
    func getType() -> String {
        assert(false, "Write it in subclass Character")
    }
}



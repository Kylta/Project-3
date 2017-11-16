//
//  Weapon.swift
//  Project-3
//
//  Created by Christophe Bugnon on 10/11/2017.
//  Copyright © 2017 Christophe Bugnon. All rights reserved.
//

import Foundation

// Master class for weapons
class Weapon {
    // Properties of class Weapon
    
    // Name for weapon (String)
    var name: String
    // Damage for weapon (Int)
    var damage: Int
    
    // Constructor
    init(name: String, damage: Int) {
        self.name = name
        self.damage = damage
    }

    // func for give infos at user of weapon
    func getInfos() -> String {
        return " \(damage) damage"
    }
}

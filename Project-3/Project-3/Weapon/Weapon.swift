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
    
    enum WeaponType {
        case Sword, Mass, Dagger, Baton, Hands
    }
    // Properties of class Weapon
    
    // Name for weapon (String)
    var name: String
    // Damage for weapon (Int)
    var damage: Int
    // Type of weapon (Sword, Mass, Dagger, Baton or Hands) from enum above
    var type: WeaponType
    // Unwrapped optional because used only on Mage and we know he had heal value at his init
    var heal: Int?
    
    // Constructor
    convenience init() {
        self.init(name: "", damage: 0, type: .Hands)
    }
    // Constructor for damager characters
    init(name: String, damage: Int, type: WeaponType) {
        self.name = name
        self.damage = damage
        self.type = type
    }
    // Constructor for healer characters
    init(name: String, damage: Int, heal: Int, type: WeaponType) {
        self.name = name
        self.heal = heal
        self.damage = damage
        self.type = type
    }

    // func for give infos at user of weapon
    func getInfos() -> String {
        return " \(damage) damage"
    }
}


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
    //
    var type: WeaponType
    //
    var heal: Int?
    
    // Constructor
    
    convenience init() {
        self.init(name: "", damage: 0, type: .Hands)
    }
    
    init(name: String, damage: Int, type: WeaponType) {
        self.name = name
        self.damage = damage
        self.type = type
    }
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


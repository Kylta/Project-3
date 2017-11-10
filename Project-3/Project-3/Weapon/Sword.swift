//
//  Sword.swift
//  Project-3
//
//  Created by Christophe Bugnon on 10/11/2017.
//  Copyright © 2017 Christophe Bugnon. All rights reserved.
//

import Foundation

// Subclass of Weapon for create Sword weapon

// Class Sword inherit of Weapon class
class Sword: Weapon {
    // Properties of class
    // let type for indicate type weapon at user
    let type = "Sword"
    
    // Constructor
    init() {
        // Name: (String), damage: 10
        super.init(name: "Sword", damage: 10)
    }
    
    // override func for indicate at player what type of weapon he will choose
    override func getInfos() -> String {
        return type + super.getInfos()
    }
}

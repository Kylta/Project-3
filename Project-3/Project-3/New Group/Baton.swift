//
//  Baton.swift
//  Project-3
//
//  Created by Christophe Bugnon on 10/11/2017.
//  Copyright © 2017 Christophe Bugnon. All rights reserved.
//

import Foundation

// Subclass of Weapon for create Sword weapon

// Class Baton inherit of Weapon class
class Baton: Weapon {
    // Properties of class
    // let type for indicate type weapon at user
    let type = "Baton"
    // Heal for baton (Mage)
    let heal = 7
    
    // Constructor
    init() {
        // Name: (String), damage: 0
        super.init(name: "Baton", damage: 0)
    }
    
    // override func for indicate at player what type of weapon he will choose
    override func getInfos() -> String {
        return type + super.getInfos()
    }
}

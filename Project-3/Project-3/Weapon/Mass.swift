//
//  Mass.swift
//  Project-3
//
//  Created by Christophe Bugnon on 10/11/2017.
//  Copyright © 2017 Christophe Bugnon. All rights reserved.
//

import Foundation

// Subclass of Weapon for create Mass weapon

// Class Mass inherit of Weapon class
class Mass: Weapon {
    // Properties of class
    // let type for indicate type weapon at user
    let type = "Mass"
    
    // Constructor
    init() {
        // Name: (String), damage: 5
        super.init(name: "Mass", damage: 5)
    }
    
    // override func for indicate at player what type of weapon he will choose
    override func getInfos() -> String {
        return type + super.getInfos()
    }
}

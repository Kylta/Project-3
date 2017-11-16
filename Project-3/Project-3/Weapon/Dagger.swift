//
//  Dagger.swift
//  Project-3
//
//  Created by Christophe Bugnon on 10/11/2017.
//  Copyright © 2017 Christophe Bugnon. All rights reserved.
//

import Foundation

// Subclass of Weapon for create Dagger weapon

// Class Dagger inherit of Weapon class
class Dagger: Weapon {
    // Properties of class
    // let type for indicate type weapon at user
    let type = "Dagger"
    
    // Constructor
    init() {
        // Name: (String), damage: 15
        super.init(name: "Dagger", damage: 150)
    }
    
    // override func for indicate at player what type of weapon he will choose
    override func getInfos() -> String {
        return type + super.getInfos()
    }
}

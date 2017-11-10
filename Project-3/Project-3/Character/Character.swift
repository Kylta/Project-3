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
    // Properties of class
    
    // Name for character (String)
    var name: String
    // Life for character (Int)
    var life: Int
    
    // Constructor
    init(name: String, life: Int) {
    self.name = name
    self.life = life
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



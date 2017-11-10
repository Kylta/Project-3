//
//  Player.swift
//  Project-3
//
//  Created by Christophe Bugnon on 10/11/2017.
//  Copyright © 2017 Christophe Bugnon. All rights reserved.
//

import Foundation

// Class player for create new player
class Player {
    // Properties of class
    
    // Name for player choose his name
    var name: String
    // Add array of character for player take Character
    var team = [Character]()
    
    // Constructor
    init(name: String) {
        self.name = name
    }
}

//
//  Game.swift
//  Project-3
//
//  Created by Christophe Bugnon on 10/11/2017.
//  Copyright © 2017 Christophe Bugnon. All rights reserved.
//

import Foundation

// Class Game for lead the game

class Game {
    // Properties of class
    
    // variable for stock player in array players
    static var players = [Player]()
    
    // Method of class
    static func stepOne() {
        // constante team for create new player
        let player = Player(name: Tools.nameCharacter())
        // add player in players array
        players.append(player)
        
        // Print instruction for user
        print("\(player.name):\nCreate your team ! (3 Characters)")
        print("1. Warrior (Damage/Tank) Life: 100, damage: 10\n2. Giant (Tank) Life: 120, damage: 5\n3. Rogue (Damage) Life: 80, damage: 15\n4. Mage (Heal) Life: 100, heal: 7")
        // Use method createTeam() of player for user create his team
        player.createTeam()
        
        // Loop for show at player these characters in his team
        print("\n\(player.name) team:")
        for character in player.team {
            print("\(character.getInfos()) \n\(character.getType())\nWeapon: \(character.weapon.getInfos())\n")
        }
        print("\n===============================\n")
    }
}

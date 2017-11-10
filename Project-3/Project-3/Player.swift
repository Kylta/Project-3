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
    
    // Method for player create his team
   func createTeam() {
        
        // repeat while array team contains 3 characters
        while team.count < 3 {
            print("\nMake a choice !")
            // constante for keep the choice of user in Tools.answerInt()
            let userChoice = Tools.answerInt()
            // Use it with while => Comments below near while
            repeat {
                // We switch userChoice, if user make choice 1 he will pick warrior, 2: giant etc...
                switch userChoice {
                case 1:
                    print("You choose Warrior")
                    let warrior = Warrior()
                    team.append(warrior)
                case 2:
                    print("You choose Giant")
                    let giant = Giant()
                    team.append(giant)
                case 3:
                    print("You choose Rogue")
                    let rogue = Rogue()
                    team.append(rogue)
                case 4:
                    print("You choose Mage")
                    let mage = Mage()
                    team.append(mage)
                default:
                    print("Choose a number between 1 and 4.\nI don't understand !")
                }
            } while (userChoice != 1 && userChoice != 2 && userChoice != 3 && userChoice != 4) // While player isn't in the range between 1..4 it repeat
        }
    }
}

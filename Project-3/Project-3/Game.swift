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
    
    // static method stepTwo for characters fight
    static func stepTwo() {
        // variable i for player 1
        var i = 0
        // variable j for player 2
        var j = 1
        
        
        // Method for print characters
        
        
        // Method for print characters opponent
        func indexOpponentCharacters() {
            // variable x for increment index
            var x = 0
            // Indicate at player character index opponent with infos
            print("\nAdverse character to target !")
            for character in players[j].team {
                print("\(x) = \(character.name) as \(character.getType()) and had \(character.life) points of life !")
                // We increment index
                x += 1
            }
            // Index return at 0
            x = 0
        }
        
        // Method for select character and secure if user take out of range character
        func selectCharacter(player: [Player]) -> Character {
            // Variable chooseCharacter of type Character
            var chooseCharacter = Character()
            // Initalise variable choice
            var choice = 0
            
            repeat {
                // We use variable choice for it use Tools.answerInt() for user choose characters
                choice = Tools.answerInt()
                
                // Check if choice is in the index of team
                if player[0].team.indices.contains(choice) {
                    chooseCharacter = player[0].team[choice]
                    // but if he choose a number out of index, it ask him to try again
                } else {
                    print("You are out of range, try again !")
                }
                // while player take an indice out of index, it loop
            } while !player[0].team.indices.contains(choice)
            // Then if he choose in index it choose character
            return chooseCharacter
        }
        
        // While the team of player 1 or player 2 is not empty, it loop.
        while !players[0].team.isEmpty || !players[1].team.isEmpty {
            
            // Loop in players
            for _ in players {
                // variable x for increment index
                var x = 0
                
                // print the name of player for he choose characters
                print("\(players[i].name) choose your character:")
                // Loop in the team of player for print them name & type (Rogue, Mage, Warrior, Giant)
                for character in players[i].team {
                    print("\(x) = \(character.name) as \(character.getType())")
                    x += 1
                }
                x = 0
                
                // Use an constante chooseCharacter for keep the choice
                let chooseCharacter = selectCharacter(player: [players[i]])
                
                // if chooseCharacter is Mage
                if let mage = chooseCharacter as? Mage {
                    // Indicate at user what character he choose
                    print("You choose \(chooseCharacter.name) (\(chooseCharacter.getType()))")
                    print("\nHeal someone of your team (yourself is right) !")
                    // Loop for have index + name & type of characters
                    for character in players[i].team {
                        print("\(x) = \(character.name) as \(character.getType())")
                        x += 1
                    }
                    x = 0
                    // Then he choose for heal someone of his team
                    mage.heal(players[i].team[Tools.answerInt()])
                } else {
                    // If chooseCharacter is different of Mage (Warrior, Rogue, Giant)
                    // Indicate at user what character he choose
                    print("You choose \(chooseCharacter.name) (\(chooseCharacter.getType()))")
                    // use indexOpponnentCharacters() for show at user opponent characters
                    indexOpponentCharacters()
                    // Then he choose pour attack an opponent character
                    chooseCharacter.attack(selectCharacter(player: [players[j]]))
                }
                // i was player 1 because before i was 0, player[0] is player 1, so now i = 1 so it become player 2 because player[1]
                i += 1
                // but if i > 2 no player have this index, so when  i > 2 we force for it is equal at 0 for become player 1 again. We just force loop
                if i == 2 {
                    i = 0
                }
                // Same than i, j was player 2, now he will be player 1 etc...
                j -= 1
                if j == -1 {
                    j = 1
                }
                
                // Loop in players
                for _ in players {
                // variable i for increment characters in team
                var i = 0
                var j = 0
                    
                    // we check character in player 1
                    for character in players[0].team {
                        // If the life of character = 0, then character is dead
                        if character.life == 0 {
                            // We indicate at player character is dead
                            print("\(character.name) is dead !\n")
                            // So we remove character of array
                            players[0].team.remove(at: i)
                            // If the team of player 1 is empty then player 2 win
                            if players[0].team.isEmpty {
                                print("\(players[1].name) win !\n")
                                exit(0)
                            }
                        }
                        // We increment of 1 for check all characters in team
                        i += 1
                    
                        // Similar that above
                        for character in players[1].team {
                            if character.life == 0 {
                                print("\(character.name) is dead !\n")
                                players[1].team.remove(at: j)
                                if players[1].team.isEmpty {
                                    print("\(players[0].name) win !\n")
                                    exit(0)
                                }
                            }
                            j += 1
                        }
                    }
                }
            }
        }
    }
}

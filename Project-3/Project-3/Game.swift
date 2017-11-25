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
    var players = [Player]()
    
    func intro() {
        print("""
               =========================================
               |         WELCOME IN THE GAME !         |
               |Each players has to choose 3 characters|
               |     to win against the opponent !     |
               |              GOOD LUCK !              |
               =========================================\n

                                BONUS:
    Mage: Blessing (heal all characters of his team +10 points of life (Level 3 and 6)
    Warrior: SpinningBlade (made all opponent characters -15 points of life (Level 3 and 6)
    Giant: Earthquake (made all opponent characters -10 points of life (Level 3 and 6)
    Rogue: Punishment (made -35 damage if opponent character is Giant or -25 damage if character if Mage, Rogue or Warrior (Level 3 and 6)
    Character need to be at all x3 turn and be chosen for up level !\n\n
    """)
    }
    
    // Method of class
    func initializeGame() {
        for i in 0...1 {
            print("PLAYER \(i + 1)")
            // constante team for create new player
            let player = Player(name: Tools.nameCharacter())
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
            print("\n==========================\n")
        }
    }
    
    // static method stepTwo for characters fight
    func fight() {
        // variable for know how many turns players play
        var turn = 0
        // variable for character up level (Bonus) Need at character to be at turnlevel 3 for up level
        //  var turnLevel = 0
        // variable for attacker player
        var attackingPlayer = players[0]
        // variable for defender player
        var defendingPlayer = players[1]
        
        print("""
             ===============
             |    FIGHT    |
             ===============\n
        """)
        // While the team of player 1 or player 2 is not empty, it loop.
        while !players[0].team.isEmpty || !players[1].team.isEmpty {
            print("Turn : \(turn)")
            // variable x for increment index
            var x = 0
            // print the name of player for he choose characters
            print("\(attackingPlayer.name) choose your character:")
            // Loop in the team of player for print them name & type (Rogue, Mage, Warrior, Giant)
            for character in attackingPlayer.team {
                print("\(x) = \(character.name) as \(character.getType())")
                x += 1
            }
            x = 0
            /* // If turnLevel > 4, then turnLevel = 1
             if turnLevel == 4 {
             turnLevel = 1
             }*/
            
            // Use an constante chooseCharacter for keep the choice of users
            let chooseCharacter = attackingPlayer.selectCharacter(player: attackingPlayer)
            
            
            // Use upLevel on chooseCharacter for character up level of 1
            chooseCharacter.upLevel(turn: chooseCharacter.turnLevel)
            
            // Use method classCharacter
            fightClassCharacter(chooseCharacter: chooseCharacter, attackingPlayer: attackingPlayer, defendingPlayer: defendingPlayer, turn: turn, turnLevel: chooseCharacter.turnLevel)
            // up turn & turnLevel when attackPlayer has be count 2 times
            if attackingPlayer === players[1] {
                turn += 1
            }
            
            // Method for check life characters and remove character if life = 0
            deathCharacter(attackingPlayer: attackingPlayer, defendingPlayer: defendingPlayer, turn: turn)
            
            chooseCharacter.turnLevel += 1
            print(" turnLevel of \(chooseCharacter.name) = \(chooseCharacter.turnLevel)")
            
            // Swap between player 1 & player 2
            swap(&attackingPlayer,&defendingPlayer)
        }
    }
    
    // Method because depend from character (Bonus, mage etc...)
    func fightClassCharacter(chooseCharacter: Character, attackingPlayer: Player, defendingPlayer: Player, turn: Int, turnLevel: Int) {
        // Init x
        var x = 0
        // Init pourcentNumber
        let pourcentNumber = 30
        
        // Condition for character use Ultimatum
        if (chooseCharacter.level == 3 && chooseCharacter.turnLevel == 6) || (chooseCharacter.level == 6 && chooseCharacter.turnLevel == 12) {
            switch chooseCharacter {
            case is Mage:
                print("Ultimatum of \(chooseCharacter.name) : BLESSING !")
                (chooseCharacter as! Mage).blessing(attackingPlayer)
            case is Warrior:
                print("Ultimatum of \(chooseCharacter.name) : SPINNING BLADE !")
                (chooseCharacter as! Warrior).spinningBlade(defendingPlayer)
                deathCharacter(attackingPlayer: attackingPlayer, defendingPlayer: defendingPlayer, turn: turn)
            case is Giant:
                print("Ultimatum of \(chooseCharacter.name) : EARTHQUAKE !")
                (chooseCharacter as! Giant).earthquake(defendingPlayer)
                deathCharacter(attackingPlayer: attackingPlayer, defendingPlayer: defendingPlayer, turn: turn)
            case is Rogue:
                print("Ultimatum of \(chooseCharacter.name) : PUNISHMENT !")
                indexOpponentCharacters(player: defendingPlayer)
                (chooseCharacter as! Rogue).punishment(defendingPlayer.team[Tools.answerInt()])
                deathCharacter(attackingPlayer: attackingPlayer, defendingPlayer: defendingPlayer, turn: turn)
                print("\nNow \(chooseCharacter.name) you can attack !")
            default:
                print("")
            }
        }
        
        if let mage = chooseCharacter as? Mage {
            // Indicate at user what character he choose
            print("You choose \(chooseCharacter.name) (\(chooseCharacter.getType()))")
            // Use mysteryBox for make appears the box with bonus
            if pourcentNumber >= Tools.randomNumber() {
                mysteryBox(character: chooseCharacter)
            }
            print("\nHeal someone of your team (yourself is right) !")
            // Loop for have index + name & type of characters
            for character in attackingPlayer.team {
                print("\(x) = \(character.name) as \(character.getType())")
                x += 1
            }
            x = 0
            // Then he choose for heal someone of his team
            let characterHeal = attackingPlayer.selectCharacter(player: attackingPlayer)
            mage.heal(characterHeal)
        } else {
            // Use mysteryBox for make appears the box with bonus
            if pourcentNumber >= Tools.randomNumber() {
                mysteryBox(character: chooseCharacter)
            }
            // use indexOpponnentCharacters() for show at user opponent characters
            indexOpponentCharacters(player: defendingPlayer)
            // Then he choose for attack an opponent character
            chooseCharacter.attack(defendingPlayer.selectCharacter(player: defendingPlayer))
        }
    }
    
    // Method if character life = 0 then remove character from array
    func deathCharacter(attackingPlayer: Player, defendingPlayer: Player, turn: Int) {
        var i = 0
        
        for characters in defendingPlayer.team {
            
            // If the life of character = 0, then character is dead
            if characters.life == 0 {
                // We indicate at player character is dead
                print("\(characters.name) is dead !\n")
                // So we remove character of array
                defendingPlayer.team.remove(at: i)
                // If the team of player 1 is empty then player 2 win
                if defendingPlayer.team.isEmpty {
                    print("\(attackingPlayer.name) win in \(turn + 1) turns !\n")
                    exit(0)
                }
            }
            // We increment of 1 for check all characters in team
            i += 1
        }
    }
    
    // Method for step 3, make appears a box in random turn
    func mysteryBox(character: Character) {
        print("\n==== MYSTERY BOX ===\nThere is a mystery box, you have 1 choice for 2 options.\n1: New weapon\n2: Armor \n=== Take your choice ! ===")
        // Explain above !
        switch Tools.answerInt() {
        case 1:
            // Init variable with method NewWeapons from Character for character change weapon
            let newWeapon = character.newWeapons(character: character)
            // If character is Mage class
            if let mage = character as? Mage {
                mage.weapon = newWeapon
                print("Now \(character.name) wear \(newWeapon.name) and add \(newWeapon.heal!) points of life !")
            } else {
            // If character in Other class
                character.weapon = newWeapon
                print("Now \(character.name) wear \(newWeapon.name) and infliged \(newWeapon.damage) damage !")
            }
        case 2:
            // If character wear more than 5 armor
            if character.armor > 5 {
                print("Your character wear already \(character.armor) armor !")
                break
            } else {
            // If character doesn't wear armor of less than 5 he get new armor
                character.armor += Int(arc4random_uniform(25) + 5)
                print("Now \(character.name) has \(character.armor) armor !")
            }
        default:
            print("I don't understand, select from 1 to 2 !")
            mysteryBox(character: character)
        }
    }
    
    // Method for print characters opponent
    func indexOpponentCharacters(player: Player) {
        // variable x for increment index
        var x = 0
        // Indicate at player character index opponent with infos
        print("\nAdverse character to target !")
        for character in player.team {
            print("\(x) = \(character.name) as \(character.getType()) had \(character.life) points of life and \(character.armor) armor ! (Level = \(character.level))")
            // We increment index
            x += 1
        }
        // Index return at 0
        x = 0
    }
}



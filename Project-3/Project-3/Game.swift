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
        // constante misteryTurn for the box appears on random turn
        let mysteryTurn = Int(arc4random_uniform(UInt32(1))) + 1
        // variable for character up level (Bonus) Need at character to be at turnlevel 3 for up level, then at the third attack or heal for Mage
        var turnLevel = 0
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
                // If turnLevel > 4, then turnLevel = 1
                if turnLevel == 4 {
                    turnLevel = 1
                }
                
                // Use an constante chooseCharacter for keep the choice of users
                let chooseCharacter = attackingPlayer.selectCharacter(player: attackingPlayer)
                
                // Use upLevel on chooseCharacter for character up level of 1
                chooseCharacter.upLevel(turn: turnLevel)
                
            // Use method classCharacter
                fightClassCharacter(chooseCharacter: chooseCharacter, attackingPlayer: attackingPlayer, defendingPlayer: defendingPlayer, turn: turn, turnLevel: turnLevel, mysteryTurn: mysteryTurn)
            // up turn & turnLevel when attackPlayer has be count 2 times
            if attackingPlayer === players[1] {
                turn += 1
                turnLevel += 1
            }
                
            // Method for check life characters and remove character if life = 0
            deathCharacter(attackingPlayer: attackingPlayer, defendingPlayer: defendingPlayer, turn: turn)
            
        // Swap between player 1 & player 2
        swap(&attackingPlayer,&defendingPlayer)
        }
    }
    // Method because depend from character (Bonus, mage etc...)
    func fightClassCharacter(chooseCharacter: Character, attackingPlayer: Player, defendingPlayer: Player, turn: Int, turnLevel: Int, mysteryTurn: Int) {
        var x = 0

        if let mage = chooseCharacter as? Mage {
            // Indicate at user what character he choose
            print("You choose \(chooseCharacter.name) (\(chooseCharacter.getType()))")
            // If Mage is level 3 or level 6 then he activate Ultimatum (passif) Bonus
            if (mage.level == 3 && turnLevel == 3) || (mage.level == 6 && turnLevel == 3) {
                print("Ultimatum of \(chooseCharacter.name) : BLESSING !")
                mage.blessing(attackingPlayer)
            }
            // Use mysteryBox for make appears the box with bonus
            if turn == mysteryTurn {
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
            // If chooseCharacter is different of Mage (Warrior, Rogue, Giant)
            // Indicate at user what character he choose
            print("You choose \(chooseCharacter.name) (\(chooseCharacter.getType()))")
            // If Warrior is level 3 or level 6 then he activate Ultimatum (passif) Bonus
            if let warrior = chooseCharacter as? Warrior {
                if (warrior.level == 3 && turnLevel == 3) || (warrior.level == 6 && turnLevel == 3) {
                    print("Ultimatum of \(chooseCharacter.name) : SPINNING BLADE !")
                    warrior.spinningBlade(defendingPlayer)
                }
            }
            if let giant = chooseCharacter as? Giant {
                // If Giant is level 3 or level 6 then he activate Ultimatum (passif) Bonus
                if (giant.level == 3 && turnLevel == 3) || (giant.level == 6 && turnLevel == 3) {
                    print("Ultimatum of \(chooseCharacter.name) : EARTHQUAKE !")
                    giant.earthquake(defendingPlayer)
                }
            }
            if let rogue = chooseCharacter as? Rogue {
                // If Rogue is level 3 or level 6 then he activate Ultimatum (passif) Bonus
                if (rogue.level == 3 && turnLevel == 3) || (rogue.level == 6 && turnLevel == 3) {
                    print("Ultimatum of \(chooseCharacter.name) : PUNISHMENT !")
                    print("Giant: 35 damage\nOther: 25 damage")
                    indexOpponentCharacters(player: defendingPlayer)
                    rogue.punishment(defendingPlayer.team[Tools.answerInt()])
                }
            }
            // Use mysteryBox for make appears the box with bonus
            if turn == mysteryTurn {
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

        /* In the box players have 2 option, 1: takes Super Weapon +5 damage for damager or +5 heal for mage or 2: takes armor and reduce damage opponent -3 points of damage (if they take out of range 1...2 then they lost bonus !) */
        print("\n==== MYSTERY BOX ===\nThere is a mystery box, you have 1 choice for 2 options.\n1: Super weapon (damage +5) if Mage: (heal +5)\n2: Armor (reduce -3 opponent damage)\n=== Take your choice ! ===")
        // Explain above !
        
        if let warrior = character as? Warrior {
            switch Tools.answerInt() {
            case 1:
                print("Warrior now has Super Sword (+5 damage)\nNow attack opponent !")
                warrior.weapon.damage += 5
            case 2:
                print("Warrior now has armor !\nNow attack opponent !")
                warrior.receiveDamage(damage: -3)
            default:
                print("You choose nothing, pick a number for 1 to 2 !")
                mysteryBox(character: warrior)
            }
        }
        // Explain above !
        if let giant = character as? Giant {
            switch Tools.answerInt() {
            case 1:
                print("Giant now has Super Mass (+5 damage)\nNow attack opponent !")
                giant.weapon.damage += 5
            case 2:
                print("Giant now has armor !\nNow attack opponent !")
                giant.receiveDamage(damage: -3)
            default:
                print("You choose nothing, pick a number for 1 to 2 !")
                mysteryBox(character: giant)
            }
        }
        // Explain above !
        if let rogue = character as? Rogue {
            switch Tools.answerInt() {
            case 1:
                print("Rogue now has Super Dagger (+5 damage)\nNow attack opponent !")
                rogue.weapon.damage += 5
            case 2:
                print("Rogue now has armor !\nNow attack opponent !")
                rogue.receiveDamage(damage: -3)
            default:
                print("You choose nothing, pick a number for 1 to 2 !")
                mysteryBox(character: rogue)
            }
        }
        // Explain above !
        if let mage = character as? Mage {
            switch Tools.answerInt() {
            case 1:
                print("Mage now has Super Baton (+5 heal)")
                if let baton = mage.weapon as? Baton {
                    baton.heal += 5
                }
            case 2:
                print("Mage now has armor !\nNow attack opponent !")
                mage.receiveDamage(damage: -3)
            default:
                print("You choose nothing, pick a number for 1 to 2 !")
                mysteryBox(character: mage)
            }
        }
    }
    
    // Method for print characters opponent
    func indexOpponentCharacters(player: Player) {
        // variable x for increment index
        var x = 0
        // Indicate at player character index opponent with infos
        print("\nAdverse character to target !")
        for character in player.team {
            print("\(x) = \(character.name) as \(character.getType()) and had \(character.life) points of life !")
            // We increment index
            x += 1
        }
        // Index return at 0
        x = 0
    }
}


//
//  main.swift
//  Project-3
//
//  Created by Christophe Bugnon on 10/11/2017.
//  Copyright © 2017 Christophe Bugnon. All rights reserved.
//

import Foundation

print("            =========================================")
print("            |         WELCOME IN THE GAME !         |")
print("            |Each players has to choose 3 characters|")
print("            |     to win against the opponent !     |")
print("            |              GOOD LUCK !              |")
print("            =========================================\n")

print("                            BONUS:\n"
    + "Mage: Blessing (heal all characters of his team +10 points of life\n (Level 3 and 6)"
    + "Warrior: SpinningBlade (made all opponent characters -15 points of life (Level 3 and 6)\n"
    + "Giant: Earthquake (made all opponent characters -10 points of life (Level 3 and 6)\n"
    + "Rogue: Punishment (made -35 damage if opponent character is Giant or -25 damage if character if Mage, Rogue or Warrior (Level 3 and 6)\n"
    + "Character need to be at all x3 turn and be chosen for up level !\n\n")

print("PLAYER 1:")
Game.stepOne()
print("\nPLAYER 2:")
Game.stepOne()


print("     ===============")
print("     |    FIGHT    |")
print("     ===============\n")


Game.stepTwo()

//
//  main.swift
//  Project-3
//
//  Created by Christophe Bugnon on 10/11/2017.
//  Copyright © 2017 Christophe Bugnon. All rights reserved.
//

import Foundation

let intro = Game()
intro.intro()

let initializeGame = Game()
initializeGame.initializeGame()

print("     ===============")
print("     |    FIGHT    |")
print("     ===============\n")

let fight = Game()
fight.stepTwo()


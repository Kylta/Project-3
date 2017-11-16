//
//  main.swift
//  Project-3
//
//  Created by Christophe Bugnon on 10/11/2017.
//  Copyright © 2017 Christophe Bugnon. All rights reserved.
//

import Foundation

let newGame = Game()
newGame.intro()
newGame.initializeGame()

print("     ===============")
print("     |    FIGHT    |")
print("     ===============\n")

newGame.fight()

//
//  main.swift
//  Project-3
//
//  Created by Christophe Bugnon on 10/11/2017.
//  Copyright © 2017 Christophe Bugnon. All rights reserved.
//

import Foundation

// Create an instance of Game class
let newGame = Game()
// Exeplain the game with intro
newGame.intro()
// Start the game
newGame.initializeGame()
// When team are create by players, the fight start.
newGame.fight()

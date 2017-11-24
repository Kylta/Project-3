//
//  Tools.swift
//  Project-3
//
//  Created by Christophe Bugnon on 10/11/2017.
//  Copyright © 2017 Christophe Bugnon. All rights reserved.
//

import Foundation

// class with tools for use it on other class like readline() for choose name for characters and others...
class Tools {
    // variable for stock name already taken by nameCharacter
    static var names = [String]()
    
    // Method for user choose name on his characters
    static func nameCharacter() -> String {
        // Indicate has user to pick a name for his character
        print("Pick a name !")
        // let answer with method readLine to interact with user
        let answer = readLine()

        var isInt: Bool {
            return Int(answer!) != nil
        }
        // constante for use method checkUniqueName in nameCharacter() for name of characters are unique
        let unique = checkUniqueName(checkName: answer!)
        
        // if unique == false we repeat nameCharacter() until name are unique
        if !unique || isInt {
            return nameCharacter()
        }
        // We force unwrapped answer because  are sure there will be a string
        return answer!.capitalized
    }
    
    // Method for check if name is unique
    static func checkUniqueName(checkName: String) -> Bool {
        
        names.append("")
        // Check in the array names if name is already taken
        for name in names {
            // If the name is not unique it indicate at user than he has to choose a new name
            if name.capitalized == checkName.capitalized {
                print("This name is already taken, try again !")
                return false
            }
        }
        // If name is not taken, then character or player can take the name, and we put the name in the array names
        names.append(checkName)
        return true
    }
    
    // Method for player to interact with him for he choose action with Int like 1,2,3,4...
    static func answerInt() -> Int {
        // let reponse with method readline for interact with user
        let reponse = readLine()
        // unwrapped reponse with secure
        if let unwrappedReponse = reponse {
            /// unwrapped unwrappedReponse for he become type Int
            if let answerInt = Int(unwrappedReponse) {
                
                // if answerInt is an Int it return the number
                return answerInt
            }
            else {
                // If answerInt is not an Int it print "I don't understand"
                print("I don't understand.")
            }
        }
        // return method answerInt until it be an Int
        return answerInt()
    }

    
    static func randomNumber() -> Int {
        
        return Int(arc4random_uniform(100) + 1)
    }
}

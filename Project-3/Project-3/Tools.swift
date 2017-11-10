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
    
    // func for user choose name on his characters
    static func nameCharacter() -> String {
        // Indicate has user to pick a name for his character
        print("Pick a name !")
        // let answer with func readLine to interact with user
        let answer = readLine()
        
        // We force unwrapped answer because  are sure there will be a string
        return answer!
    }
}

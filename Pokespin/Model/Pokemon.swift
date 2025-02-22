//
//  Pokemon.swift
//  Pokespin
//
//  Created by Montserrat Arroyo on 2/21/25.
//

import Combine

class Pokemon {
    var name: String
    var number: String
    var isUnlocked: Bool
    
    init(name: String, number: String, isUnlocked: Bool) {
        self.name = name
        self.number = number
        self.isUnlocked = isUnlocked
    }

    func unlock() {
        isUnlocked.toggle()
    }
}

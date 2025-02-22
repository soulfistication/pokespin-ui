//
//  Pokemon.swift
//  Pokespin
//
//  Created by Montserrat Arroyo on 2/21/25.
//

struct Pokemon: IPokemon, Codable {
    var name: String
    var number: String
    var isUnlocked: Bool

    mutating func unlock() {
        isUnlocked.toggle()
    }
}

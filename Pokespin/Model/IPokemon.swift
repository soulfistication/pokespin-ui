//
//  IPokemon.swift
//  Pokespin
//
//  Created by Montserrat Arroyo on 2/21/25.
//

protocol IPokemon {
    var name: String { get }
    var number: String { get }
    var isUnlocked: Bool { get }
    mutating func unlock()
}

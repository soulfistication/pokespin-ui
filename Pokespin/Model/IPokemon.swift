//
//  IPokemon.swift
//  Pokespin
//
//  Created by Montserrat Arroyo on 2/21/25.
//

import Combine

protocol IPokemon: ObservableObject {
    var name: String { get }
    var number: String { get }
    var isUnlocked: Bool { get }
    func unlock()
}

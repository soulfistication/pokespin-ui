//
//  Constants.swift
//  Pokespin
//
//  Created by Montserrat Arroyo on 2/20/25.
//

struct Constants {

    static let numberOfPokemonsDisplayed = 18
    static let numberOfColumnsInSlotMachine = 3
    static let numberOfRowsInSlotMachine = 36

    enum ApiURL: String {
        case baseURL = "https://pokeapi.co";
        case pokemonEndpoint = "pokemon";
    }
}

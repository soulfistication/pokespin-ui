//
//  PokemonStorage.swift
//  Pokespin
//
//  Created by Montserrat Arroyo on 2/21/25.
//

import Combine

class PokemonStorage: ObservableObject {
    
    @Published var pokemons: [Pokemon]

    init() {
        pokemons = [Pokemon]()
        for i in 1...18 {
            pokemons.append(Pokemon(name: convertName(number: i),
                                    number: "\(i)",
                                    isUnlocked: (i % 2 != 0)))
        }
    }

    func convertName(number: Int) -> String {
        switch number {
        case 1: return "Bulbasaur"
        case 2: return "Ivysaur"
        case 3: return "Venusaur"
        case 4: return "Charmander"
        case 5: return "Charmeleon"
        case 6: return "Charizard"
        case 7: return "Squirtle"
        case 8: return "Wartortle"
        case 9: return "Blastoise"
        case 10: return "Caterpie"
        case 11: return "Metapod"
        case 12: return "Butterfree"
        case 13: return "Weedle"
        case 14: return "Kakuna"
        case 15: return "Beedrill"
        case 16: return "Pidgey"
        case 17: return "Pidgeotto"
        case 18: return "Pidgeot"
        default: return "N/A"
        }
    }
}

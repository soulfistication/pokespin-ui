//
//  PokemonsView.swift
//  Pokespin
//
//  Created by Iván Almada on 11/27/23.
//

import SwiftUI

protocol IPokemon {
    var name: String { get }
    var number: String { get }
    var isUnlocked: Bool { get }
    mutating func unlock()
}


struct Pokemon: IPokemon {
    var name: String
    var number: String
    var isUnlocked: Bool

    mutating func unlock() {
        isUnlocked.toggle()
    }
}

class PokemonStorage: ObservableObject {
    
    @Published var pokemons: [IPokemon]

    init(pokemons: [IPokemon]) {
        self.pokemons = pokemons
    }

    static func generatePokemons() -> [IPokemon] {
        var pokemons = [Pokemon]()
        for i in 1...18 {
            pokemons.append(Pokemon(name: convertName(number: i),
                                    number: "\(i)",
                                    isUnlocked: (i % 2 != 0)))
        }
        return pokemons
    }
    
    static func convertName(number: Int) -> String {
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


struct PokemonsView: View {

    @StateObject var pokemonStorage: PokemonStorage

    var body: some View {
        Grid {
            ForEach (0..<6) { row in
                GridRow {
                    ForEach(0..<3) { column in
                        let index = 3 * row + column
                        let pokemon = pokemonStorage.pokemons[index]
                        PokemonCellView(pokemon: pokemon)
                    }
                }
            }
        }
        .navigationTitle("Pokemons")
        .padding(.all)
    }

}

#Preview {
    PokemonsView(pokemonStorage: PokemonStorage(pokemons: PokemonStorage.generatePokemons()))
}

//
//  PokemonsView.swift
//  Pokespin
//
//  Created by Iván Almada on 11/27/23.
//

import SwiftUI

protocol IPokemon {
    var number: String { get }
    var isUnlocked: Bool { get }
    mutating func unlock()
}


struct Pokemon: IPokemon {
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
            pokemons.append(Pokemon(number: "\(i)",
                                isUnlocked: (i % 2 != 0)))
        }
        return pokemons
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

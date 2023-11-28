//
//  PokemonsView.swift
//  Pokespin
//
//  Created by Iván Almada on 11/27/23.
//

import SwiftUI

struct Pokemon {
    var number: String
    var isUnlocked: Bool
}

func generateMockPokemons() -> [Pokemon] {
    var pokemons = [Pokemon]()
    for i in 1...18 {
        pokemons.append(Pokemon(number: "\(i)",
                            isUnlocked: (i%2 != 0)))
    }
    return pokemons
}

struct PokemonsView: View {

    var pokemons: [Pokemon]

    var body: some View {
        Grid {
            ForEach (0..<6) { row in
                GridRow {
                    ForEach(0..<3) { column in
                        let index = 3 * row + column
                        let pokemon = pokemons[index]
                        PokemonCellView(pokemon: pokemon)
                    }
                }
            }
        }
    }

}

#Preview {
    PokemonsView(pokemons: generateMockPokemons())
}

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

struct PokemonsView: View {

    var pokemons: [Pokemon] {
        var result = [Pokemon]()
        for i in 0..<18 {
            result.append(Pokemon(number: "\(i)", isUnlocked: (i%2 == 0)))
        }
        return result
    }

    var body: some View {
        Grid {
            ForEach (0..<6) { row in
                GridRow {
                    ForEach(0..<3) { column in
                        let index = 3 * row + column
                        let pokemon = pokemons[index]
                        if pokemon.isUnlocked {
                            NavigationLink {
                                PokemonView(pokemon: pokemon)
                            } label: {
                                Image(String(index+1))
                                    .resizable()
                                    .frame(width: 60, height: 60)
                            }
                        } else {
                            NavigationLink {
                                SlotMachineContainerView(pokemon: pokemon)
                            } label: {
                                Text("\(pokemons[index].number)")
                                    .font(.largeTitle)
                                    .padding()
                            }
                        }
                    }
                }
            }
        }
    }

}

#Preview {
    PokemonsView()
}

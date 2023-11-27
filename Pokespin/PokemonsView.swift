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
                        var index = 3 * row + column
                        var pokemon = pokemons[index]
                        if pokemon.isUnlocked {
                            Image(String(index+1))
                                .resizable()
                                .frame(width: 30, height: 30)
                        } else {
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

#Preview {
    PokemonsView()
}

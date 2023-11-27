//
//  PokemonsView.swift
//  Pokespin
//
//  Created by Iván Almada on 11/27/23.
//

import SwiftUI

struct Pokemon {
    var number: String
}

struct PokemonsView: View {

    var pokemons: [Pokemon] {
        var result = [Pokemon]()
        for i in 0..<18 {
            result.append(Pokemon(number: "\(i)"))
        }
        return result
    }

    var body: some View {
        Grid {
            ForEach (0..<6) { row in
                GridRow {
                    ForEach(0..<3) { column in
                        Text("\(pokemons[3*row+column].number)")
                            .font(.largeTitle)
                            .padding()
                    }
                }
            }
        }
    }

}

#Preview {
    PokemonsView()
}

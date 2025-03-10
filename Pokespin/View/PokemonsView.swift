//
//  PokemonsView.swift
//  Pokespin
//
//  Created by Iván Almada on 11/27/23.
//

import SwiftUI

struct PokemonsView: View {

    @StateObject var pokemonStorage = PokemonStorage()

    var body: some View {
        Grid {
            ForEach (0..<6) { row in
                GridRow {
                    ForEach(0..<3) { column in
                        let index = 3 * row + column
                        PokemonCellView(index: index)
                    }
                }
            }
        }
        .navigationTitle("Pokemons")
        .padding(.all)
        .environmentObject(pokemonStorage)
    }

}

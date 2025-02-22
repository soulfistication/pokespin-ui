//
//  PokemonsView.swift
//  Pokespin
//
//  Created by Iván Almada on 11/27/23.
//

import SwiftUI

struct PokemonsView: View {

    @StateObject private var pokemonStorage = PokemonStorage()

    var body: some View {
        Grid {
            ForEach (0..<6) { row in
                GridRow {
                    ForEach(0..<3) { column in
                        let index = 3 * row + column
                        PokemonCellView(index: index, pokemonStorage: $pokemonStorage)
                    }
                }
            }
        }
        .navigationTitle("Pokemons")
        .padding(.all)
    }

}

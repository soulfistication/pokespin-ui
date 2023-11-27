//
//  Pokemon.swift
//  Pokespin
//
//  Created by Iván Almada on 11/27/23.
//

import SwiftUI

struct PokemonView: View {

    var pokemon: Pokemon

    var body: some View {
        Text(pokemon.number)
    }
}

#Preview {
    PokemonView(pokemon: Pokemon(number: "1", isUnlocked: false))
}

//
//  Pokemon.swift
//  Pokespin
//
//  Created by Iván Almada on 11/27/23.
//

import SwiftUI

struct PokemonDetailView: View {

    var pokemon: Pokemon

    var body: some View {
        VStack {
            Text("Unlocked Pokemon")
            Image(pokemon.number)
                .resizable()
                .scaledToFit()
        }
    }
}

#Preview {
    PokemonDetailView(pokemon: Pokemon(number: "1",
                                 isUnlocked: false))
}

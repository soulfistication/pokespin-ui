//
//  Pokemon.swift
//  Pokespin
//
//  Created by Iván Almada on 11/27/23.
//

import SwiftUI

struct PokemonDetailView: View {

    var pokemon: IPokemon

    var body: some View {
        VStack {
            Text("You unlocked this Pokemon")
            Image(pokemon.number)
                .resizable()
                .scaledToFit()
        }
        .navigationTitle("Pokemon")
    }
}

#Preview {
    PokemonDetailView(pokemon: Pokemon(number: "1",
                                 isUnlocked: false))
}

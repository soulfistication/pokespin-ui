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
            Text("You unlocked: \(pokemon.name)")
                .font(.title)
            Text("Pokemon number: \(pokemon.number)")
                .font(.title2)
            Image(pokemon.number)
                .resizable()
                .scaledToFit()
                .padding(.all)
        }
        .navigationTitle("Pokemon")
    }
}

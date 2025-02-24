//
//  Pokemon.swift
//  Pokespin
//
//  Created by Iván Almada on 11/27/23.
//

import SwiftUI

struct PokemonDetailView: View {
    
    let index: Int
    
    @EnvironmentObject var pokemonStorage: PokemonStorage
    
    var body: some View {
        VStack {
            Text("You unlocked: \(pokemonStorage.pokemons[index].name)")
                .font(.title)
            Text("Pokemon number: \(pokemonStorage.pokemons[index].number)")
                .font(.title2)
            Image(pokemonStorage.pokemons[index].number)
                .resizable()
                .scaledToFit()
                .padding(.all)
        }
        .navigationTitle("Pokemon")
    }
}

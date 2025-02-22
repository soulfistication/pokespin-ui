//
//  PokemonCellView.swift
//  Pokespin
//
//  Created by Iván Almada on 11/28/23.
//

import SwiftUI

struct PokemonCellView: View {
    
    let index: Int

    @Binding var pokemonStorage: PokemonStorage
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .foregroundColor(Color(uiColor: UIColor.creamyBlue))
            if pokemonStorage.pokemons[index].isUnlocked {
                NavigationLink {
                    PokemonDetailView(pokemon: pokemonStorage.pokemons[index])
                } label: {
                    Image(String(pokemonStorage.pokemons[index].number))
                        .resizable()
                        .frame(width: 60, height: 60)
                }
            } else {
                NavigationLink {
                    SlotMachineView(index: index, pokemonStorage: $pokemonStorage)
                } label: {
                    Text("\(pokemonStorage.pokemons[index].number)")
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                        .padding()
                }
            }
        }
    }
}

//
//  PokemonCellView.swift
//  Pokespin
//
//  Created by Iván Almada on 11/28/23.
//

import SwiftUI

struct PokemonCellView: View {

    @State var pokemon: IPokemon

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .foregroundColor(.mint)
            if pokemon.isUnlocked {
                NavigationLink {
                    PokemonDetailView(pokemon: pokemon)
                } label: {
                    Image(String(pokemon.number))
                        .resizable()
                        .frame(width: 60, height: 60)
                }
            } else {
                NavigationLink {
                    SlotMachineView(pokemon: $pokemon)
                } label: {
                    Text("\(pokemon.number)")
                        .font(.largeTitle)
                        .padding()
                }
            }
        }
    }
}

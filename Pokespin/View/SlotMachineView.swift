//
//  SlotMachineView.swift
//  Pokespin
//
//  Created by Montserrat Arroyo on 2/21/25.
//

import SwiftUI

struct SlotMachineView: View {
    
    let index: Int

    @EnvironmentObject var pokemonStorage: PokemonStorage
    @State var sheetIsPresented = false
    @State var userHasWon = false
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            VStack {
                Text("Now playing to unlock Pokemon:")
                    .font(.headline)
                Text(pokemonStorage.pokemons[index].number)
                    .font(.largeTitle)
            }
            HStack {
                Image("SpinPokemon")
                    .resizable()
                    .frame(width: 120, height: 100)
                Text("Good Luck!")
                    .font(.title3)
                    .bold()
            }
            .padding(.bottom)
            SlotMachineContainerView(index: index,
                                     userHasWon: $userHasWon,
                                     sheetIsPresented: $sheetIsPresented)
            .sheet(isPresented: $sheetIsPresented) {
                if userHasWon {
                    VStack {
                        Text("🎉 Congratulations! 🥳")
                            .font(.title3)
                            .padding(.all)
                        Text("You unlocked:")
                            .font(.caption)
                            .padding(.all)
                        Text(pokemonStorage.pokemons[index].name)
                            .font(.title3)
                            .bold()
                            .padding(.all)
                    }
                    Image(pokemonStorage.pokemons[index].number)
                        .resizable()
                        .scaledToFit()
                } else {
                    Text("You lost 🙁. Please try again.")
                        .font(.title3)
                        .padding(.all)
                }
                Button(action: {
                    sheetIsPresented = false
                    dismiss()
                }, label: {
                    Text("OK")
                        .font(.title3)
                })
            }
        }
        .padding(.all)
    }
}

//
//  SlotMachineContainerView.swift
//  Pokespin
//
//  Created by Iván Almada on 11/27/23.
//

import SwiftUI

struct SlotMachineContainerView: View {

    @Binding var pokemon: IPokemon

    var body: some View {
        Text("Playing to win Pokemon: \(pokemon.number)")
        Spacer()
        Button(action: {
            self.pokemon.unlock()
        }, label: {
            Text("Unlock this pokemon")
        })
    }
}

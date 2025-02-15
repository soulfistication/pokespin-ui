//
//  SlotMachineContainerView.swift
//  Pokespin
//
//  Created by Iván Almada on 11/27/23.
//

import SwiftUI

struct SlotMachineContainerView: View {

    var pokemon: IPokemon

    var body: some View {
        Text("Playing to win Pokemon: \(pokemon.number)")
        Spacer()
        Button(action: {
            //pokemon.unlock()
        }, label: {
            Text("Unlock")
        })
    }
}

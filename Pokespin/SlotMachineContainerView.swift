//
//  SlotMachineContainerView.swift
//  Pokespin
//
//  Created by Iván Almada on 11/27/23.
//

import SwiftUI

struct SlotMachineContainerView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> SlotMachineViewController {
        let slotMachineViewController = SlotMachineViewController()
        return slotMachineViewController
    }
    
    func updateUIViewController(_ uiViewController: SlotMachineViewController, context: Context) {
        
    }
    
}

struct SlotMachineView: View {

    @Binding var pokemon: IPokemon
    
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Text("Playing to unlock Pokemon: \(pokemon.number)")
            HStack {
                Image("SpinPokemon")
                    .resizable()
                    .frame(width: 100, height: 100)
                Text("Good luck!")
            }
            SlotMachineContainerView()
            Spacer()
            Button(action: {
                self.pokemon.unlock()
                dismiss()
            }, label: {
                Text("Play to unlock this pokemon")
            })
        }
        .padding(.all)
    }
}

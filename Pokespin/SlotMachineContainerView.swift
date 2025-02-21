//
//  SlotMachineContainerView.swift
//  Pokespin
//
//  Created by Iván Almada on 11/27/23.
//

import SwiftUI

struct SlotMachineContainerView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> SlotMachineViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let slotMachineViewController = storyBoard.instantiateViewController(identifier: "SlotMachineViewController") as SlotMachineViewController
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
            VStack {
                Text("Now playing to unlock Pokemon:")
                    .font(.headline)
                Text(pokemon.number)
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

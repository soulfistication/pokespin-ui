//
//  SlotMachineContainerView.swift
//  Pokespin
//
//  Created by Iván Almada on 11/27/23.
//

import SwiftUI

struct SlotMachineContainerView: UIViewControllerRepresentable {
    
    let index: Int
    
    @Binding var userHasWon: Bool
    @Binding var sheetIsPresented: Bool
    @Binding var pokemonStorage: PokemonStorage
    
    class Coordinator: NSObject, SlotMachineExecutable {
        
        var parent: SlotMachineContainerView
        
        init(_ parent: SlotMachineContainerView) {
            self.parent = parent
        }
        
        func slotMachineExecuted(win: Bool) {
            parent.userHasWon = win
            parent.sheetIsPresented = true
            if win {
                var pokemon = parent.pokemonStorage.pokemons[parent.index]
                pokemon.unlock()
            }
        }
    }
    
    func makeUIViewController(context: Context) -> SlotMachineViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let slotMachineViewController = storyBoard.instantiateViewController(identifier: "SlotMachineViewController") as SlotMachineViewController
        slotMachineViewController.delegate = context.coordinator
        return slotMachineViewController
    }
    
    func updateUIViewController(_ uiViewController: SlotMachineViewController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
}

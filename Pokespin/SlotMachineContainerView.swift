//
//  SlotMachineContainerView.swift
//  Pokespin
//
//  Created by Iván Almada on 11/27/23.
//

import SwiftUI

struct SlotMachineContainerView: UIViewControllerRepresentable {
    
    var finishFlow: (Bool) -> Void
    
    class Coordinator: NSObject, SlotMachineExecutable {
        
        var flow: (Bool) -> Void
        
        init(flow: @escaping (Bool) -> Void) {
            self.flow = flow
        }
        
        func slotMachineExecuted(win: Bool) {
            flow(win)
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
        Coordinator(flow: self.finishFlow)
    }
    
}

struct SlotMachineView: View {

    @Binding var pokemon: IPokemon
    
    @State var sheetIsPresented = false
    
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
            SlotMachineContainerView { win in
                if win { self.pokemon.unlock() }
                sheetIsPresented = true
            }.sheet(isPresented: $sheetIsPresented) {
                if pokemon.isUnlocked {
                    Text("Congratulations. You unlocked: \(pokemon.name)")
                        .font(.title3)
                        .padding(.all)
                    Image(pokemon.number)
                        .resizable()
                        .scaledToFit()
                } else {
                    Text("You lost. Please try again.")
                        .font(.title3)
                        .padding(.all)
                }
                Button("Ok") {
                    sheetIsPresented = false
                    dismiss()
                }
            }
        }
        .padding(.all)
    }
}

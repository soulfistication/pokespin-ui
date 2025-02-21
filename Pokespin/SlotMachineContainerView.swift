//
//  SlotMachineContainerView.swift
//  Pokespin
//
//  Created by Iván Almada on 11/27/23.
//

import SwiftUI

struct SlotMachineContainerView: UIViewControllerRepresentable {
    
    @Binding var userHasWon: Bool
    @Binding var sheetIsPresented: Bool
    @Binding var pokemon: IPokemon
    
    class Coordinator: NSObject, SlotMachineExecutable {
        
        var parent: SlotMachineContainerView
        
        init(_ parent: SlotMachineContainerView) {
            self.parent = parent
        }
        
        func slotMachineExecuted(win: Bool) {
            parent.userHasWon = win
            parent.sheetIsPresented = true
            if win {
                parent.pokemon.unlock()
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

struct SlotMachineView: View {

    @Binding var pokemon: IPokemon
    @State var sheetIsPresented = false
    @State var userHasWon = false
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
            SlotMachineContainerView(userHasWon: $userHasWon,
                                     sheetIsPresented: $sheetIsPresented,
                                     pokemon: $pokemon)
            .sheet(isPresented: $sheetIsPresented) {
                if userHasWon {
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

//
//  ContentView.swift
//  Pokespin
//
//  Created by Iván Almada on 11/27/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            Image("PokeSpinLogo")
                .resizable()
                .scaledToFit()
                .padding(.all)
            Image("PokemonStartScreen")
            Spacer()
            Text("Pokemon Spin is a small lottery game for iOS. The goal of the game is to collect all the possible Pokemon. You do so by spinning a slot machine and unlocking one Pokemon at a time. It was developed during the Christmas time as a quick prototype test. I hope you enjoy it.")
                .font(.footnote)
            Spacer()
            Button("Start Game") { startGame() }
                .padding(.all)
            Button("Reset progress") { resetProgress() }
                .padding(.bottom)
            Text("Copyright Iván Almada 2024")
                .font(.footnote)
        }
        .padding()
    }
    
    func startGame() {
        
    }
    
    func resetProgress() {
        
    }
}

#Preview {
    ContentView()
}

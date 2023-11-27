//
//  PokemonsView.swift
//  Pokespin
//
//  Created by Iván Almada on 11/27/23.
//

import SwiftUI

struct Pokemon {
    var number: String
}

struct PokemonsView: View {

    var pokemons: [Pokemon] = [Pokemon(number: "1"),
                               Pokemon(number: "2"),
                               Pokemon(number: "3")]

    var body: some View {
        List(pokemons, id: \.number) { pokemon in
            Text(pokemon.number)
        }
    }

}

#Preview {
    PokemonsView()
}

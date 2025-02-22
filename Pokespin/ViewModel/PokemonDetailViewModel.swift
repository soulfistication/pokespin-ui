//
//  PokemonDetailViewModel.swift
//  Pokespin
//
//  Created by Montserrat Arroyo on 2/21/25.
//

import Foundation

public class PokemonDetailViewModel {
    
    var client = NetworkClient()
    
    var pokemonNumber: Int
    
    var pokemon: IPokemon?
    
    init(pokemonNumber: Int) {
        self.pokemonNumber = pokemonNumber
    }
    
    func fetchPokemon() async -> Pokemon? {
        do {
            let pokemonData = try await client.requestJSON(pokemonNumber: pokemonNumber)
            let decoder = JSONDecoder()
            var pokemon = try decoder.decode(Pokemon.self, from: pokemonData)
            pokemon.isUnlocked = true
            self.pokemon = pokemon
            // PokemonManager.add(pokemon: pokemon)
            return pokemon
        } catch (let error) {
            print(String(describing: error))
            return nil
        }

    }
}

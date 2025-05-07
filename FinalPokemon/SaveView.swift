//
//  SaveView.swift
//  FinalPokemon
//
//  Created by PETERS, CARLIE E. on 5/7/25.
//

import SwiftUI

struct SaveView: View {
    init(poke: PokemonViewModel){
        self.pokeView = poke
    }
    @ObservedObject var pokeView: PokemonViewModel
    
    var body: some View {
        VStack {
            if pokeView.pokemonList.isEmpty {
                Text("No Pokémon saved")
                    .foregroundColor(.black)
                    .bold()
            } else {
                List(pokeView.pokemonList, id: \.name) { pokemon in
                    HStack {
                        Text(pokemon.name.capitalized)
                        Spacer()
                        Text("EXP: \(pokemon.base_experience)")
                    }
                }
            }
        }
    }
}


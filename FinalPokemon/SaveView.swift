//
//  SaveView.swift
//  FinalPokemon
//
//  Created by PETERS, CARLIE E. on 5/7/25.
//

import SwiftUI

struct SaveView: View {
    @StateObject var pokemonViewModel = PokemonViewModel()
    
    var body: some View {
        VStack {
            if pokemonViewModel.pokemonList.isEmpty {
                Text("No Pokémon saved")
                    .foregroundColor(.black)
                    .bold()
            } else {
                List(pokemonViewModel.pokemonList, id: \.name) { pokemon in
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



#Preview {
    SaveView()
}

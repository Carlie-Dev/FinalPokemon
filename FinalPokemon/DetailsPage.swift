//
//  DetailsPage.swift
//  FinalPokemon
//
//  Created by PETERS, CARLIE E. on 5/7/25.
//

import SwiftUI

struct DetailsPage: View {
    init(poke: PokemonViewModel){
        self.pokeView = poke
    }
    @ObservedObject var pokeView: PokemonViewModel
    
    var body: some View {
        VStack{
            Text(pokeView.name).font(.title).fontWeight(.bold)
            Text("XP: \(pokeView.base_experience)").font(.headline)
            Text("Height: \(pokeView.height)")
            Text("Weight: \(pokeView.weight)")
        }.padding(10)
        
    }
}


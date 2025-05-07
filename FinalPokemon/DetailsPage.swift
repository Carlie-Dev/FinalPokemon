//
//  DetailsPage.swift
//  FinalPokemon
//
//  Created by PETERS, CARLIE E. on 5/7/25.
//

import SwiftUI

struct DetailsPage: View {
    @StateObject var poke = PokemonViewModel()
    
    var body: some View {
        VStack{
            Text(poke.name).font(.title).fontWeight(.bold)
            Text("XP: \(poke.base_experience)").font(.headline)
            Text("Height: \(poke.height)")
            Text("Weight: \(poke.weight)")
        }.padding(10)
        
    }
}

#Preview {
    DetailsPage()
}

//
//  ContentView.swift
//  FinalPokemon
//
//  Created by PETERS, CARLIE E. on 4/28/25.
//

import SwiftUI

struct ContentView: View {
    @State var pokeViewModel = PokemonViewModel()
    @State private var pokename: String = ""
    var body: some View {
        //If the string for the name is empty, prompt the user to enter a pokemon's name
        if pokeViewModel.name.isEmpty {
            Text("Please enter a Pokemon name...")
        }else{
            VStack {
                Text(pokeViewModel.name)
                    .font(.title)
                    .fontWeight(.bold)
                Text("XP: \(pokeViewModel.base_experience)")
                Text("Height: \(pokeViewModel.height)")
                Text("Weight: \(pokeViewModel.weight)")
                
            }
            .padding()
        }
        HStack {
            //This is the text feild with the variable for searching for the pokemon.
            TextField("Enter Pokemon Name", text: $pokename)
               //pokename is a string that will be passed into the pokeViewModel
            Button(action: {
//                pokeViewModel.fetchPokemon(name: pokename)
            }) {
                Text("Search")
            }
        }.padding(.horizontal, 50)
        
        
    }
}

#Preview {
    ContentView()
}

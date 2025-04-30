//
//  ListView.swift
//  FinalPokemon
//
//  Created by PETERS, CARLIE E. on 4/30/25.
//

import SwiftUI

struct ListView: View {
    @StateObject var pokeViewModel = PokemonViewModel()
    @State var pokename: String = ""
    var body: some View {
        //If the string for the name is empty, prompt the user to enter a pokemon's name
        VStack{
            if pokeViewModel.name.isEmpty {
                Text("Please enter a valid Pokemon name...")
            }else{
                Text(pokeViewModel.name)
                .padding()
            }
            HStack {
                //This is the text feild with the variable for searching for the pokemon.
                TextField("Enter Pokemon Name", text: $pokename).autocapitalization(.none)
                //pokename is a string that will be passed into the fetch pokemon function
                Button("Search"){
                    Task{
                        await pokeViewModel.fetchPokemon(name: pokename)
                        print ("\(pokeViewModel.name) fetched")
                    }
                }
            }.padding(.horizontal, 50)
        }.padding()
        
    }
    
}
#Preview {
    ListView()
}

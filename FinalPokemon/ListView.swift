//
//  ListView.swift
//  FinalPokemon
//
//  Created by PETERS, CARLIE E. on 4/30/25.
//

import SwiftUI

struct ListView: View {
    init(poke: PokemonViewModel){
        self.pokeView = poke
    }
    @ObservedObject var pokeView: PokemonViewModel
    @State var pokename: String = ""
    var body: some View {
        //If the string for the name is empty, prompt the user to enter a pokemon's name
        VStack{
            VStack{
                List(pokeView.pokemonBaseList, id: \.name) { pokemon in
                        Text(pokemon.name.capitalized)
                            }
                    }
                    .onAppear {
                        pokeView.fetchList()
                    }
                if pokeView.name.isEmpty {
                    Text("Please enter a valid Pokemon name...")
                }else{
                    Text(pokeView.name + " Found!")
                    .padding()
                }
                HStack {
                    //This is the text feild with the variable for searching for the pokemon.
                    TextField("Enter Pokemon Name", text: $pokename).autocapitalization(.none)
                    //pokename is a string that will be passed into the fetch pokemon function
                    Button("Search"){
                        Task{
                            await pokeView.fetchPokemon(name: pokename)
                            print ("\(pokeView.name) fetched")
                            
                        }
                    }
                    Button("Save"){
                        Task{
                            pokeView.savePokemon()
                        }
                    }
                    
                }.padding(.horizontal, 50)
            }.padding()
            
    }
}

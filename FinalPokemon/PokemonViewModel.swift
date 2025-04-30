//
//  PokemonViewModel.swift
//  FinalPokemon
//
//  Created by PETERS, CARLIE E. on 4/28/25.
//

import Foundation
class PokemonViewModel: ObservableObject{
    //Variables for the pokemon w/ defaults
    @Published var name: String = ""
    @Published var base_experience : Int = 0
    @Published var height : Int = 0
    @Published var weight : Int = 0
    
    func fetchPokemon(name: String) async {
        //Get pokemon by name value
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(name)/") else {
            print("Invalid URL")
            return
        }
        
        //URL session
        URLSession.shared.dataTask(with: url){data, response, error in
        if let data = data{
            do {
                let decodedResponse = try JSONDecoder().decode(PokemonResponse.self, from: data)
                
                //Getting all the values from the API
                DispatchQueue.main.async {
                    self.name = decodedResponse.pokemon.name
                    self.base_experience = decodedResponse.pokemon.base_experience
                    self.height = decodedResponse.pokemon.height
                    self.weight = decodedResponse.pokemon.weight
                }
                
            }catch {
                print("Failed to decode: \(error)")
            }
        }else if let error = error{
            print("Decoding Error: \(error)")
        }
        }
        
    }
}

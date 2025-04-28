//
//  PokemonViewModel.swift
//  FinalPokemon
//
//  Created by PETERS, CARLIE E. on 4/28/25.
//

import Foundation
class PokemonViewModel: ObservableObject{
    private var name: String = ""
    
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
                
                DispatchQueue.main.async {
                    self.name = decodedResponse.name
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

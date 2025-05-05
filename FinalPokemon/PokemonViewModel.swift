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
    
    //variable for baselist
    @Published var pokemonBaseList: [PokemonListEntry] = []
    
    func fetchPokemon(name: String){
        //Get pokemon by name value
        //Cut down text input by making sure things are in the write case
        let name = name.lowercased().trimmingCharacters(in: .whitespaces)
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(name)/") else {
            print("Invalid URL")
            return
        }
        
        //URL session
        URLSession.shared.dataTask(with: url){data, response, error in
        if let data = data{
            do {
                let decodedResponse = try JSONDecoder().decode(Pokemon.self, from: data)
                print("decoding json")
                //Getting all the values from the API
                DispatchQueue.main.async {
                    self.name = decodedResponse.name
                    print(self.name)
                    self.base_experience = decodedResponse.base_experience
                    print(self.base_experience)
                    self.height = decodedResponse.height
                    print(self.base_experience)
                    self.weight = decodedResponse.weight
                    print(self.weight)
                }
                print(self.name)
                
            }catch {
                print("Failed to decode: \(error)")
            }
        }else if let error = error{
            print("Decoding Error: \(error)")
        }
        }.resume()
    }
    
    func fetchList(){
            guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=5") else {
                print("Invalid URL")
                return
            }

            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let listResponse = try decoder.decode(PokemonList.self, from: data)
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            self.pokemonBaseList = listResponse.results
                            print("Fetched list: \(self.pokemonBaseList)")
                    }
                    } catch {
                        print("Decoding error: \(error)")
                    }
                } else if let error = error {
                    print("Network error: \(error)")
                }
            }.resume()
    }
    
}

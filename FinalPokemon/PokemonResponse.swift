//
//  PokemonResponse.swift
//  FinalPokemon
//
//  Created by PETERS, CARLIE E. on 4/28/25.
//

import Foundation

//Pokemon object with the values I am pulling from the API
struct Pokemon: Codable {
    let name: String
    let base_experience: Int
    let height: Int
    let weight: Int
}

struct PokemonList: Codable {
    let results: [PokemonListEntry]
}

struct PokemonListEntry: Identifiable, Codable {
    let name: String
    let url: String
    var id: String { name }
}

struct PokemonSaved: Codable {
    let savedList: [Pokemon]
}

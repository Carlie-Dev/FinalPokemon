//
//  PokemonResponse.swift
//  FinalPokemon
//
//  Created by PETERS, CARLIE E. on 4/28/25.
//

import Foundation

struct PokemonResponse: Codable {
    let pokemon: Pokemon
}

//Pokemon object with the values I am pulling from the API
struct Pokemon: Codable {
    let name : String
    let base_experience: Int
    let height: Int
    let weight: Int
}

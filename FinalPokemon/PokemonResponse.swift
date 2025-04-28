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

struct Pokemon: Codable {
    let name : String
    let image: String
}

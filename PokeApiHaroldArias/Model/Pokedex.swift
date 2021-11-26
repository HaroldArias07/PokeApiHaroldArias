//
//  Pokedex.swift
//  PokeApiHaroldArias
//
//  Created by MAC08 on 25/11/21.
//

import Foundation

struct Pokedex: Decodable {

    let count: Int
    let results: [ListPokemon]
    
}

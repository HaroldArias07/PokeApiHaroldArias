//
//  ListPokemon.swift
//  PokeApiHaroldArias
//
//  Created by MAC08 on 25/11/21.
//

import Foundation

//ListPokemon
struct ListPokemon: Decodable {
    let count: Int
    let results: [Result]
}

//Result
struct Result: Decodable {
    let name: String
    let url: String
}

//
//  PokeViewModel.swift
//  PokeApiHaroldArias
//
//  Created by MAC08 on 25/11/21.
//

import Foundation

struct PokeViewModel {
    
    //Función encargada de obtener los datos del pokemon, por ejemplo el nombre y url de la api.
    func GetPokeApi(comp : @escaping ([Result])->()) {
        let api = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=50")
        
        URLSession.shared.dataTask(with: api!) {
            (data, response, error) in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            //Si no hay ningun error se encargará de decodificar el JSON.
            do {
                let result = try JSONDecoder().decode(ListPokemon.self, from: data!)
                comp(result.results)
            } catch {
                
            }
        }.resume()
    }
}

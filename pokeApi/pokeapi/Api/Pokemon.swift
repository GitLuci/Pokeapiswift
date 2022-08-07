//
//  Pokemon.swift
//  pokeapi
//
//  Created by Elizangela Rodrigues on 03/08/2022.
//https://pokeapi.co/api/v2/pokemon/?limit=151

import Foundation

struct Pokemon:Codable{
    var results:[PokemonEntry]
    
}

struct PokemonEntry: Codable, Identifiable{
    let id = UUID()
    var name: String
    var url: String
}



class PokeApi {
    func getData(completion:@escaping([PokemonEntry])-> ()) {
        guard let url = URL(string:"https://pokeapi.co/api/v2/pokemon/?limit=151") else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {(data,response,error) in
            guard let data = data else{return}
            print(data)
            let pokemonList = try! JSONDecoder().decode(Pokemon.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonList.results)
            }
            
        }
        task.resume()
    }
    
}




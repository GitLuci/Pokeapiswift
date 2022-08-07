//
//  PokemonSelected.swift
//  pokeapi
//
//  Created by Elizangela Rodrigues on 03/08/2022.
//

import Foundation

struct PokemonSelected: Codable{
    var sprites: PokemonSprites
    var weight:Int = 200
}

struct PokemonSprites: Codable {
    var front_default:String?
}

class PokemonSelectedApi {
    func getData(url:String, completion:@escaping(PokemonSprites)-> ()) {
        guard let url = URL(string:url) else{return}
        
        URLSession.shared.dataTask(with: url) {(data,response,error) in
            guard let data = data else{return}
            let pokemonSprite = try! JSONDecoder().decode(PokemonSelected.self, from: data)
            DispatchQueue.main.async {
                completion(pokemonSprite.sprites)
            }
            
        }.resume()
    }
    
    
}



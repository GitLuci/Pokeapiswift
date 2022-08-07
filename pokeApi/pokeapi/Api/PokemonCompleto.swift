//
//  PokemonCompleto.swift
//  pokeapi
//
//  Created by Elizangela Rodrigues on 06/08/2022.
//

import Foundation


class PokemonCompleto:Identifiable{
    let id = UUID()
    var nick:String?
    var url:String?
    var life:String?
    
    init(nick:String,url:String,life:String) {
        self.nick = nick
        self.url = url
        self.life = life
    }
    
    
}

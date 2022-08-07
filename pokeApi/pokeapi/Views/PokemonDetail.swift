//
//  PokemonDetail.swift
//  pokeapi
//
//  Created by Elizangela Rodrigues on 05/08/2022.
//

import SwiftUI

struct PokemonDetail: View {
    static var pklistabt = [PokemonCompleto(nick: "pikachu", url: "https://pokeapi.co/api/v2/pokemon/25/", life: "100")]
    static var pkenemy = [PokemonCompleto(nick: "Dragonite", url: "https://pokeapi.co/api/v2/pokemon/dragonite", life: "100")]
    @State var nome:String = "teste"
    @State var imagem:String = ""
    @State var tipo:String = ""
    @State var hp:String = ""
    @State var valorhp:String = ""
    var urlima:String = ""
    var body: some View {

        NavigationView{
        VStack{
            PokemonImage(imageLink: "\(imagem)")
                .padding(.trailing,1)
        Text("Dano: xx")
        Text("Vida: ")
        Text("Tipo: xx")
            
            Button {
                if PokemonDetail.pklistabt.count >= 3 {
                    print("Limite na lista")
                }else{
                    PokemonDetail.pklistabt.append(PokemonCompleto(nick: nome, url: imagem, life: valorhp))
                    
                }
                
            } label: {
                Text("Adicionar pokemon ao time")
            }
            
            Button {
                if PokemonDetail.pklistabt.count >= 0 {
                    PokemonDetail.pklistabt.removeAll()
                }
                
            } label: {
                Text("Limpar time de pokemon")
            }
            
            Button {
                PokemonDetail.pkenemy.append(PokemonCompleto(nick: nome, url: imagem, life: valorhp))
                }label: {
                Text("Adicionar inimigo")
            }
            
            
            
            List(PokemonDetail.pklistabt){
                Text($0.nick ?? "nome pokemon")
            }
            
            
            

            
            }
        }.navigationTitle("\(nome)")
    }

    func getstts(url:String) {
        var tempstts:String?
        var tempvalor:String?
        PKstatusselected().getData(url: url) {stts in
            tempstts = stts.name
            tempvalor = stts.base_stat
            hp = tempstts ?? "placeholder"
            valorhp = tempvalor ?? "placeholder"
            print(valorhp)
            print(hp)
        }
    }
    
    
}


struct PokemonDetail_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetail()
        
    }
}

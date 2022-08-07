//
//  BatalhaView.swift
//  pokeapi
//
//  Created by Elizangela Rodrigues on 07/08/2022.
//

import SwiftUI

struct BatalhaView: View {
    @State var vitoria:Bool = true
    @State var pklistabt = PokemonDetail.pklistabt
    @State var pkenemy = PokemonDetail.pkenemy
    @State var history = []
    var body: some View {
        VStack{
            HStack{
            ForEach(pkenemy){pe in
                PokemonImage(imageLink: pe.url ?? "Imagem")
            }}
        }
        VStack{
            HStack{
            
                ForEach(pklistabt){pk in
                    PokemonImage(imageLink: pk.url ?? "imagem")
                }
            }
            
        }
        
    }
}

struct BatalhaView_Previews: PreviewProvider {
    static var previews: some View {
        BatalhaView()
    }
}

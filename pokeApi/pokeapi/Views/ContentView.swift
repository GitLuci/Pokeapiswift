//
//  ContentView.swift
//  pokeapi
//
//  Created by Elizangela Rodrigues on 03/08/2022.
//

import SwiftUI


struct ContentView: View {
    @State var pkesc:String = ""
    @State var pokemon = [PokemonEntry]()
    @State var searchText = ""
    var body: some View {
        
        NavigationView{
            List{
                NavigationLink("Ir a batalha") {
                    BatalhaView(pklistabt: PokemonDetail.pklistabt)
                }
                
                NavigationLink("Historico de lutas") {
                    Historico()
                }
                    
                
                
                ForEach(searchText == "" ? pokemon : pokemon.filter({
                    $0.name.contains(searchText.lowercased())
                })) {entry in
                    HStack{
                        PokemonImage(imageLink: "\(entry.url)")
                            .padding(.trailing,20)
                        NavigationLink("\(entry.name)".capitalized,destination:
                                        PokemonDetail(nome: entry.name,imagem: entry.url))
                    }
                }
            }.onAppear{
                PokeApi().getData() {pokemon in
                    self.pokemon = pokemon
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Pokedex")

            
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

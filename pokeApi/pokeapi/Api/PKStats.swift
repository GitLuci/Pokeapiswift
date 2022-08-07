//
//  PKStats.swift
//  pokeapi
//
//  Created by Elizangela Rodrigues on 06/08/2022.
//

import Foundation

struct PKvalores: Codable{
    var sttsURL:String = ""
    var stats:PKStats 
}

struct PKStats: Codable {
    var name:String?
    var base_stat:String?
}
class PKstatusselected {
    func getData(url:String, completion:@escaping(PKStats)-> ()) {
        guard let url = URL(string:url) else{return}
        
        URLSession.shared.dataTask(with: url) {(data,response,error) in
            guard let data = data else{return}
            let PKstatus = try! JSONDecoder().decode(PKvalores.self, from: data)
            DispatchQueue.main.async {
                completion(PKstatus.stats)
            }
            
        }.resume()
    }
    
    
}

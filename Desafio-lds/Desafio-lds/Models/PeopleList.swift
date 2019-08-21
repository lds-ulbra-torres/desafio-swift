//
//  Pessoas.swift
//  Desafio-lds
//
//  Created by Jaisson Monteiro on 18/08/19.
//  Copyright © 2019 Jaisson Monteiro. All rights reserved.
//

import Foundation

struct PeopleList : Codable {
    
    var count : Int = 0
    var next : String = ""
    var previous : String?
    var results : [Person] = []
    
}

extension PeopleList {
    static func fetchPeople(success: @escaping (PeopleList) -> Void, error : @escaping (String) -> Void) {
        
        let url = URL(string: "https://swapi.co/api/people/")!
        let task = URLSession.shared.dataTask(with: url) { (dados, URLResposta, erros) in
            if let erros = erros {
                print(erros)
            }
            let jsonDecode = JSONDecoder()
            if let dados = dados, let peopleList = try? jsonDecode.decode(PeopleList.self, from: dados) {
                success(peopleList)
            } else {
                error("Erro ao buscar os dados")
            }
        }
        task.resume()
    }
}


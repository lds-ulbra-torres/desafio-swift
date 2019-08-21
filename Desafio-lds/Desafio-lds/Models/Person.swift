//
//  People.swift
//  Desafio-lds
//
//  Created by Jaisson Monteiro on 18/08/19.
//  Copyright © 2019 Jaisson Monteiro. All rights reserved.
//

import Foundation

struct Person : Codable {
    let name,height,mass, hair_color, skin_color, eye_color : String
    let birth_year, gender, homeworld, created,edited, url : String
    let films, species, vehicles, starships: [String]
}
